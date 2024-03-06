import Foundation

public class StudentVue {
    private let credentials: Credentials
    
    static private let edupointCredentials: Credentials = Credentials(username: "EdupointDistrictInfo", password: "Edup01nt", districtURL: "https://support.edupoint.com")
    
    public init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    public convenience init(username: String, password: String, districtURL: String) {
        let credentials = Credentials(username: username, password: password, districtURL: districtURL)
        self.init(credentials: credentials)
    }
}

extension StudentVue {
    private func processRequest(method: String, paramString: String) async throws -> String {
        let body: String =
            """
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
            <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>\(credentials.username)</userID>
            <password>\(credentials.password)</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>0</parent>
            <webServiceHandleName>PXPWebServices</webServiceHandleName>
            <methodName>\(method)</methodName>
            <paramStr>\(paramString)</paramStr>
            </ProcessWebServiceRequest>
            </soap:Body>
            </soap:Envelope>
            """
        
        guard let url = URL(string: credentials.districtURL + "/Service/PXPCommunication.asmx") else {
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
    
    public func makeRequest(method: String, params: [String: String] = [:]) async throws -> String {
        let paramStr = "&lt;Parms&gt;" + params.reduce("") { accumulation, pair in
            accumulation + "&lt;\(pair.key)&gt;\(pair.value)&lt;/\(pair.key)&gt;"
        } + "&lt;/Parms&gt;"
        let processedRequest = try await processRequest(method: method, paramString: paramStr)
        return processedRequest.replacingEscapements()
    }
    
    private static func processRequest(method: String, paramString: String) async throws -> String {
        let body: String =
            """
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
            <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>\(edupointCredentials.username)</userID>
            <password>\(edupointCredentials.password)</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>0</parent>
            <webServiceHandleName>HDInfoServices</webServiceHandleName>
            <methodName>\(method)</methodName>
            <paramStr>\(paramString)</paramStr>
            </ProcessWebServiceRequest>
            </soap:Body>
            </soap:Envelope>
            """
        
        guard let url = URL(string: edupointCredentials.districtURL + "/Service/HDInfoCommunication.asmx") else {
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
    
    public static func makeRequest(method: String, params: [String: String] = [:]) async throws -> String {
        let paramStr = "&lt;Parms&gt;" + params.reduce("") { accumulation, pair in
            accumulation + "&lt;\(pair.key)&gt;\(pair.value)&lt;/\(pair.key)&gt;"
        } + "&lt;/Parms&gt;"
        let processedRequest = try await processRequest(method: method, paramString: paramStr)
        return processedRequest.replacingEscapements()
    }
}

extension StudentVue {
    public func getMessages() async throws -> String {
        return try await makeRequest(method: "GetPXPMessages")
    }
    
    public func getCalendar() async throws -> StudentCalendar {
        let result = try await makeRequest(method: "StudentCalendar")
        
        return try StudentCalendarParser(string: result).parse()
    }
    
    public func getAttendance() async throws -> Attendance {
        let result = try await makeRequest(method: "Attendance")
        
        return try AttendanceParser(string: result).parse()
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async throws -> Gradebook {
        var params: [String: String] = [:]
        if let period = reportPeriod {
            params = ["ReportPeriod": "\(period)"]
        }
        let result = try await makeRequest(method: "Gradebook", params: params)
        
        return try GradebookParser(string: result).parse()
    }
    
    public func getClassNotes() async throws -> String {
        return try await makeRequest(method: "StudentHWNotes")
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        let string = try await makeRequest(method: "StudentInfo")
        
        return try StudentInfoParser(string: string).parse()
    }
    
    public func getSchedule(termIndex: Int? = nil) async throws -> Schedule {
        var params: [String: String] = [:]
        if let term = termIndex {
            params = ["TermIndex": "\(term)"]
        }
        let string = try await makeRequest(method: "StudentClassList", params: params)
        
        return try ScheduleParser(string: string).parse()
    }
    
    public func getStaffInfo() async throws -> [StaffInfo] {
        let result = try await makeRequest(method: "StudentSchoolInfo")
        
        return try StaffInfoParser(string: result).parse()
    }
    
    public func listReportCards() async throws -> [ReportCardInfo] {
        let result = try await makeRequest(method: "GetReportCardInitialData")
        
        return try ReportCardInfoParser(string: result).parse()
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        return try await makeRequest(method: "GetReportCardDocumentData", params: ["DocumentGU": documentGUID])
    }
    
    public func listDocuments() async throws -> [DocumentInfo] {
        let result = try await makeRequest(method: "GetStudentDocumentInitialData")
        
        return try DocumentInfoParser(string: result).parse()
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        return try await makeRequest(method: "GetContentOfAttachedDoc", params: ["DocumentGU": documentGUID])
    }
    
    public static func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        let string = try await makeRequest(method: "GetMatchingDistrictList", params: ["Key":"5E4B7859-B805-474B-A833-FDB15D205D40", "MatchToDistrictZipCode":"\(zip)"])
        
        return try DistrictInfoParser(string: string).parse()
    }
    
    public func getMailInboxCount() async throws -> MailInboxCount {
        let result = try await makeRequest(method: "SynergyMailGetInboxCount")
        
        return try MailInboxCountParser(string: result).parse()
    }
    
    public func verifyCredentials() async throws -> Bool {
        do {
            let _ = try await getMailInboxCount()
            return true
        } catch SwiftVueError.invalidCredentials {
            return false
        }
    }
}
