import Foundation

public class StudentVue {
    var dataProvider: DataProvider
    
    public init(provider: DataProvider) {
        self.dataProvider = provider
    }
    
    public init(credentials: Credentials, isPreview: Bool) {
        if isPreview {
            self.dataProvider = PreviewDataProvider(credentials: credentials)
        } else {
            self.dataProvider = RealDataProvider(credentials: credentials)
        }
    }
    
    public init(username: String, password: String, districtURL: String, isPreview: Bool) {
        if isPreview {
            self.dataProvider = PreviewDataProvider(username: username, password: password, districtURL: districtURL)
        } else {
            self.dataProvider = RealDataProvider(username: username, password: password, districtURL: districtURL)
        }
    }
}

extension StudentVue {
    public func getMessages() async throws -> String {
        return try await dataProvider.getMessages()
    }
    
    public func getCalendar() async throws -> String {
        return try await dataProvider.getCalendar()
    }
    
    public func getAttendance() async throws -> Attendance {
        return try await dataProvider.getAttendance()
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async throws -> Gradebook {
        return try await dataProvider.getGradebook(reportPeriod: reportPeriod)
    }
    
    public func getClassNotes() async throws -> String {
        return try await dataProvider.getClassNotes()
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        return try await dataProvider.getStudentInfo()
    }
    
    public func getSchedule(termIndex: Int? = nil) async throws -> Schedule {
        return try await dataProvider.getSchedule(termIndex: termIndex)
    }
    
    public func getSchoolInfo() async throws -> String {
        return try await dataProvider.getSchoolInfo()
    }
    
    public func listReportCards() async throws -> String {
        return try await dataProvider.listReportCards()
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        return try await dataProvider.getReportCard(documentGUID: documentGUID)
    }
    
    public func listDocuments() async throws -> String {
        return try await dataProvider.listDocuments()
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        return try await dataProvider.getDocument(documentGUID: documentGUID)
    }
    
    public func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        return try await dataProvider.getDistrictList(zip: zip)
    }
    
    public func getMailInboxCount() async throws -> String {
        return try await dataProvider.getMailInboxCount()
    }
    
    public func verifyCredentials() async throws -> Bool {
        return try await dataProvider.verifyCredentials()
    }
}
