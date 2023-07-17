import Foundation

public class StudentVue {
    var credentials: Credentials
    static private let edupointCredentials: Credentials = Credentials(username: "EdupointDistrictInfo", password: "Edup01nt", districtURL: "https://support.edupoint.com")
    
    public init(credentials: Credentials) {
        self.credentials = credentials
    }
    
    public init(username: String, password: String, districtURL: String) {
        self.credentials = Credentials(username: username, password: password, districtURL: districtURL)
    }
}

// Instance Methods
extension StudentVue {
    private func processRequest(method: String, paramString: String, handle: String, user: Bool) async -> Result<String, Error> {
        // HTTP body
        let body: String =
            """
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
            <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>\(user ? credentials.username : Self.edupointCredentials.username)</userID>
            <password>\(user ? credentials.password : Self.edupointCredentials.password)</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>0</parent>
            <webServiceHandleName>\(handle)</webServiceHandleName>
            <methodName>\(method)</methodName>
            <paramStr>\(paramString)</paramStr>
            </ProcessWebServiceRequest>
            </soap:Body>
            </soap:Envelope>
            """
        
        // Make URL
        guard let url = URL(string: (user ? credentials.districtURL : Self.edupointCredentials.districtURL) + (user ? "/Service/PXPCommunication.asmx" : "/Service/HDInfoCommunication.asmx")) else {
            return .failure(SwiftVueError.urlError)
        }
        
        // Assemble Request
        var request: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        request.addValue("text/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("http://edupoint.com/webservices/ProcessWebServiceRequest", forHTTPHeaderField: "SOAPAction")
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(SwiftVueError.networkError)
            }
            
            guard let result = String(data: data, encoding: .utf8) else {
                return .failure(SwiftVueError.decodingError)
            }
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
    
    public func makeRequest(method: String, params: [String: String] = [:], handle: String, user: Bool = true) async -> Result<String, Error> {
        let paramStr = "&lt;Parms&gt;" + params.reduce("") { accumulation, pair in
            accumulation + "&lt;\(pair.key)&gt;\(pair.value)&lt;/\(pair.key)&gt;"
        } + "&lt;/Parms&gt;"
        let processedRequest = await processRequest(method: method, paramString: paramStr, handle: handle, user: user)
        switch processedRequest {
        case .success(let success):
            return .success(success.replacingEscapements())
        case .failure(let failure):
            return .failure(failure)
        }
    }
}

// Instance convenience methods
extension StudentVue {
    public func getMessages() async -> Result<String, Error> {
        return await makeRequest(method: "GetPXPMessages", handle: "PXPWebServices")
    }
    
    public func getCalendar() async -> Result<String, Error> {
        return await makeRequest(method: "StudentCalendar", handle: "PXPWebServices")
    }
    
    public func getAttendance() async -> Result<String, Error> {
        return await makeRequest(method: "Attendance", handle: "PXPWebServices")
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async -> Result<Gradebook, Error> {
        var params: [String: String] = [:]
        if let period = reportPeriod {
            params = ["ReportPeriod": "\(period)"]
        }
        let result = await makeRequest(method: "Gradebook", params: params, handle: "PXPWebServices")
        switch result {
        case .success(let success):
            if !success.contains("Gradebook") {
                return .failure(SwiftVueError.credentialError)
            }
            return GradebookParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    public func getClassNotes() async -> Result<String, Error> {
        return await makeRequest(method: "StudentHWNotes", handle: "PXPWebServices")
    }
    
    public func getStudentInfo() async -> Result<StudentInfo, Error> {
        let string = await makeRequest(method: "StudentInfo", handle: "PXPWebServices")
        switch string {
        case .success(let success):
            if !success.contains("StudentInfo") {
                return .failure(SwiftVueError.credentialError)
            }
            return StudentInfoParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    public func getSchedule(termIndex: Int? = nil) async -> Result<Schedule, Error> {
        var params: [String: String] = [:]
        if let term = termIndex {
            params = ["TermIndex": "\(term)"]
        }
        let string = await makeRequest(method: "StudentClassList", params: params, handle: "PXPWebServices")
        switch string {
        case .success(let success):
            if !success.contains("StudentClassSchedule") {
                return .failure(SwiftVueError.credentialError)
            }
            return ScheduleParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    public func getSchoolInfo() async -> Result<String, Error> {
        return await makeRequest(method: "StudentSchoolInfo", handle: "PXPWebServices")
    }
    
    public func listReportCards() async -> Result<String, Error> {
        return await makeRequest(method: "GetReportCardInitialData", handle: "PXPWebServices")
    }
    
    public func getReportCard(documentGUID: String) async -> Result<String, Error> {
        return await makeRequest(method: "GetReportCardDocumentData", params: ["DocumentGU": documentGUID], handle: "PXPWebServices")
    }
    
    public func listDocuments() async -> Result<String, Error> {
        return await makeRequest(method: "GetStudentDocumentInitialData", handle: "PXPWebServices")
    }
    
    public func getDocument(documentGUID: String) async -> Result<String, Error> {
        return await makeRequest(method: "GetContentOfAttachedDoc", params: ["DocumentGU": documentGUID], handle: "PXPWebServices")
    }
    
    public func getDistrictList(zip: String) async -> Result<[DistrictInfo], Error> {
        let string = await makeRequest(method: "GetMatchingDistrictList", params: ["Key":"5E4B7859-B805-474B-A833-FDB15D205D40", "MatchToDistrictZipCode":"\(zip)"], handle: "HDInfoServices", user: true)
        switch string {
        case .success(let success):
            if !success.contains("DistrictList") {
                return .failure(SwiftVueError.credentialError)
            }
            return DistrictInfoParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    public func getMailInboxCount() async -> Result<String, Error> {
        return await makeRequest(method: "SynergyMailGetInboxCount", handle: "PXPWebServices")
    }
    
    public func verifyCredentials() async -> Result<Bool, Error> {
        let string = await getMailInboxCount()
        switch string {
        case .success(let success):
            return .success(success.contains("SynergyMailInboxCountXML"))
        case .failure(let failure):
            return .failure(failure)
        }
    }
}

// Static Methods
extension StudentVue {
    static private func processRequest(method: String, params: String, handle: String, host: String, path: String, user: String, pass: String) async -> Result<String, Error> {
        let body: String =
            """
            <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
            <ProcessWebServiceRequest xmlns="http://edupoint.com/webservices/">
            <userID>\(user)</userID><password>\(pass)</password>
            <skipLoginLog>1</skipLoginLog>
            <parent>0</parent>
            <webServiceHandleName>\(handle)</webServiceHandleName>
            <methodName>\(method)</methodName>
            <paramStr>\(params)</paramStr>
            </ProcessWebServiceRequest>
            </soap:Body>
            </soap:Envelope>
            """
        let url = URL(string: host + path)!
        var request: URLRequest = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.addValue("text/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("http://edupoint.com/webservices/ProcessWebServiceRequest", forHTTPHeaderField: "SOAPAction")
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(SwiftVueError.networkError)
            }
            
            guard let result = String(data: data, encoding: .utf8) else {
                return .failure(SwiftVueError.decodingError)
            }
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
    
    static public func makeRequest(method: String, params: [String: String] = [:], handle: String, host: String, path: String, user: String, pass: String) async -> Result<String, Error> {
        let paramStr = "&lt;Parms&gt;" + params.reduce("") { accumulation, pair in
            accumulation + "&lt;\(pair.key)&gt;\(pair.value)&lt;/\(pair.key)&gt;"
        } + "&lt;/Parms&gt;"
        let processedRequest = await processRequest(method: method, params: paramStr, handle: handle, host: host, path: path, user: user, pass: pass)
        switch processedRequest {
        case .success(let success):
            return .success(success.replacingEscapements())
        case .failure(let failure):
            return .failure(failure)
        }
    }
}

//Static convenience methods
extension StudentVue {
    static public func getMessages(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "GetPXPMessages", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getCalendar(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "StudentCalendar", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getAttendance(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "Attendance", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getGradebook(_ credentials: Credentials, reportPeriod: Int? = nil) async -> Result<Gradebook, Error> {
        var params: [String: String] = [:]
        if let period = reportPeriod {
            params = ["ReportPeriod": "\(period)"]
        }
        let result = await makeRequest(method: "Gradebook", params: params, handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
        switch result {
        case .success(let success):
            if !success.contains("Gradebook") {
                return .failure(SwiftVueError.credentialError)
            }
            return GradebookParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    static public func getClassNotes(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "StudentHWNotes", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    //Composing/Sending Student Mail
    
    //Getting Student Mail
    
    static public func getStudentInfo(_ credentials: Credentials) async -> Result<StudentInfo, Error> {
        let string = await makeRequest(method: "StudentInfo", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
        switch string {
        case .success(let success):
            if !success.contains("StudentInfo") {
                return .failure(SwiftVueError.credentialError)
            }
            return StudentInfoParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    static public func getSchedule(_ credentials: Credentials, termIndex: Int? = nil) async -> Result<Schedule, Error> {
        var params: [String: String] = [:]
        if let term = termIndex {
            params = ["TermIndex": "\(term)"]
        }
        let string = await makeRequest(method: "StudentClassList", params: params, handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
        switch string {
        case .success(let success):
            if !success.contains("StudentClassSchedule") {
                return .failure(SwiftVueError.credentialError)
            }
            return ScheduleParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    static public func getSchoolInfo(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "StudentSchoolInfo", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    //Getting Class Websites
    
    static public func listReportCards(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "GetReportCardInitialData", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getReportCard(_ credentials: Credentials, documentGuid: String) async -> Result<String, Error> {
        return await makeRequest(method: "GetReportCardDocumentData", params: ["DocumentGU": documentGuid], handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func listDocuments(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "GetStudentDocumentInitialData", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getDocument(_ credentials: Credentials, documentGuid: String) async -> Result<String, Error> {
        return await makeRequest(method: "GetContentOfAttachedDoc", params: ["DocumentGU": documentGuid], handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func getDistrictList(zip: String) async -> Result<[DistrictInfo], Error> {
        let string = await makeRequest(method: "GetMatchingDistrictList", params: ["Key":"5E4B7859-B805-474B-A833-FDB15D205D40", "MatchToDistrictZipCode":"\(zip)"], handle: "HDInfoServices", host: "https://support.edupoint.com", path: "/Service/HDInfoCommunication.asmx", user: "EdupointDistrictInfo", pass: "Edup01nt")
        switch string {
        case .success(let success):
            if !success.contains("DistrictList") {
                return .failure(SwiftVueError.credentialError)
            }
            return DistrictInfoParser(string: success).parse()
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
    static public func getMailInboxCount(_ credentials: Credentials) async -> Result<String, Error> {
        return await makeRequest(method: "SynergyMailGetInboxCount", handle: "PXPWebServices", host: credentials.districtURL, path: "/Service/PXPCommunication.asmx", user: credentials.username, pass: credentials.password)
    }
    
    static public func verifyCredentials(_ credentials: Credentials) async -> Result<Bool, Error> {
        let string = await Self.getMailInboxCount(credentials)
        switch string {
        case .success(let success):
            return .success(success.contains("SynergyMailInboxCountXML"))
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
