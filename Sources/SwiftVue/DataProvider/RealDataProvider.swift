//
//  RealDataProvider.swift
//  
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public class RealDataProvider: DataProvider {
    var credentials: Credentials
    
    static private let edupointCredentials: Credentials = Credentials(username: "EdupointDistrictInfo", password: "Edup01nt", districtURL: "https://support.edupoint.com")
    
    public init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    public init(username: String, password: String, districtURL: String) {
        self.credentials = Credentials(username: username, password: password, districtURL: districtURL)
    }
    
    private func processRequest(method: String, paramString: String, handle: String, user: Bool) async throws -> String {
        let username: String = if user { credentials.username } else { Self.edupointCredentials.username }
        let password: String = if user { credentials.password } else { Self.edupointCredentials.password }
        
        let body: String =
            """
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
            <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>\(username)</userID>
            <password>\(password)</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>0</parent>
            <webServiceHandleName>\(handle)</webServiceHandleName>
            <methodName>\(method)</methodName>
            <paramStr>\(paramString)</paramStr>
            </ProcessWebServiceRequest>
            </soap:Body>
            </soap:Envelope>
            """
        
        guard let url = URL(string: (user ? credentials.districtURL : Self.edupointCredentials.districtURL) + (user ? "/Service/PXPCommunication.asmx" : "/Service/HDInfoCommunication.asmx")) else {
            throw SwiftVueError.invalidURL
        }
        
        var request: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        request.addValue("text/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("http://edupoint.com/webservices/ProcessWebServiceRequest", forHTTPHeaderField: "SOAPAction")
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw SwiftVueError.invalidResponse
        }
        
        guard let result = String(data: data, encoding: .utf8) else {
            throw SwiftVueError.couldNotDecodeResponse
        }
        
        return result
    }
    
    public func makeRequest(method: String, params: [String: String] = [:], handle: String, user: Bool = true) async throws -> String {
        let paramStr = "&lt;Parms&gt;" + params.reduce("") { accumulation, pair in
            accumulation + "&lt;\(pair.key)&gt;\(pair.value)&lt;/\(pair.key)&gt;"
        } + "&lt;/Parms&gt;"
        let processedRequest = try await processRequest(method: method, paramString: paramStr, handle: handle, user: user)
        return processedRequest.replacingEscapements()
    }
    
    public func getMessages() async throws -> String {
        return try await makeRequest(method: "GetPXPMessages", handle: "PXPWebServices")
    }
    
    public func getCalendar() async throws -> String {
        return try await makeRequest(method: "StudentCalendar", handle: "PXPWebServices")
    }
    
    public func getAttendance() async throws -> String {
        return try await makeRequest(method: "Attendance", handle: "PXPWebServices")
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async throws -> Gradebook {
        var params: [String: String] = [:]
        if let period = reportPeriod {
            params = ["ReportPeriod": "\(period)"]
        }
        let result = try await makeRequest(method: "Gradebook", params: params, handle: "PXPWebServices")
        
        if !result.contains("Gradebook") {
            throw SwiftVueError.invalidCredentials
        }
        
        return try GradebookParser(string: result).parse()
    }
    
    public func getClassNotes() async throws -> String {
        return try await makeRequest(method: "StudentHWNotes", handle: "PXPWebServices")
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        let string = try await makeRequest(method: "StudentInfo", handle: "PXPWebServices")
        if !string.contains("StudentInfo") {
            throw SwiftVueError.invalidCredentials
        }
        return try StudentInfoParser(string: string).parse()
    }
    
    public func getSchedule(termIndex: Int? = nil) async throws -> Schedule {
        var params: [String: String] = [:]
        if let term = termIndex {
            params = ["TermIndex": "\(term)"]
        }
        let string = try await makeRequest(method: "StudentClassList", params: params, handle: "PXPWebServices")
        if !string.contains("StudentClassSchedule") {
            throw SwiftVueError.invalidCredentials
        }
        return try ScheduleParser(string: string).parse()
    }
    
    public func getSchoolInfo() async throws -> String {
        return try await makeRequest(method: "StudentSchoolInfo", handle: "PXPWebServices")
    }
    
    public func listReportCards() async throws -> String {
        return try await makeRequest(method: "GetReportCardInitialData", handle: "PXPWebServices")
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        return try await makeRequest(method: "GetReportCardDocumentData", params: ["DocumentGU": documentGUID], handle: "PXPWebServices")
    }
    
    public func listDocuments() async throws -> String {
        return try await makeRequest(method: "GetStudentDocumentInitialData", handle: "PXPWebServices")
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        return try await makeRequest(method: "GetContentOfAttachedDoc", params: ["DocumentGU": documentGUID], handle: "PXPWebServices")
    }
    
    public func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        let string = try await makeRequest(method: "GetMatchingDistrictList", params: ["Key":"5E4B7859-B805-474B-A833-FDB15D205D40", "MatchToDistrictZipCode":"\(zip)"], handle: "HDInfoServices", user: true)
        if !string.contains("DistrictList") {
            throw SwiftVueError.invalidCredentials
        }
        return try DistrictInfoParser(string: string).parse()
    }
    
    public func getMailInboxCount() async throws -> String {
        return try await makeRequest(method: "SynergyMailGetInboxCount", handle: "PXPWebServices")
    }
    
    public func verifyCredentials() async throws -> Bool {
        let string = try await getMailInboxCount()
        return string.contains("SynergyMailInboxCountXML")
    }
}
