import Foundation

public class StudentVue<Provider: DataProvider> {
    var provider: Provider
    
    public init(credentials: Credentials) {
        self.provider = Provider(credentials: credentials)
    }
    
    public convenience init(username: String, password: String, districtURL: String) {
        let credentials = Credentials(username: username, password: password, districtURL: districtURL)
        self.init(credentials: credentials)
    }
}

extension StudentVue {
    public func getMessages() async throws -> String {
        return try await provider.getMessages()
    }
    
    public func getCalendar() async throws -> String {
        return try await provider.getCalendar()
    }
    
    public func getAttendance() async throws -> Attendance {
        return try await provider.getAttendance()
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async throws -> Gradebook {
        return try await provider.getGradebook(reportPeriod: reportPeriod)
    }
    
    public func getClassNotes() async throws -> String {
        return try await provider.getClassNotes()
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        return try await provider.getStudentInfo()
    }
    
    public func getSchedule(termIndex: Int? = nil) async throws -> Schedule {
        return try await provider.getSchedule(termIndex: termIndex)
    }
    
    public func getSchoolInfo() async throws -> String {
        return try await provider.getSchoolInfo()
    }
    
    public func listReportCards() async throws -> String {
        return try await provider.listReportCards()
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        return try await provider.getReportCard(documentGUID: documentGUID)
    }
    
    public func listDocuments() async throws -> String {
        return try await provider.listDocuments()
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        return try await provider.getDocument(documentGUID: documentGUID)
    }
    
    public static func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        return try await Provider.getDistrictList(zip: zip)
    }
    
    public func getMailInboxCount() async throws -> String {
        return try await provider.getMailInboxCount()
    }
    
    public func verifyCredentials() async throws -> Bool {
        return try await provider.verifyCredentials()
    }
}
