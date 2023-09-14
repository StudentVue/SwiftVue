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
    public func getMessages() async -> Result<String, Error> {
        return await dataProvider.getMessages()
    }
    
    public func getCalendar() async -> Result<String, Error> {
        return await dataProvider.getCalendar()
    }
    
    public func getAttendance() async -> Result<String, Error> {
        return await dataProvider.getAttendance()
    }
    
    public func getGradebook(reportPeriod: Int? = nil) async -> Result<Gradebook, Error> {
        return await dataProvider.getGradebook(reportPeriod: reportPeriod)
    }
    
    public func getClassNotes() async -> Result<String, Error> {
        return await dataProvider.getClassNotes()
    }
    
    public func getStudentInfo() async -> Result<StudentInfo, Error> {
        return await dataProvider.getStudentInfo()
    }
    
    public func getSchedule(termIndex: Int? = nil) async -> Result<Schedule, Error> {
        return await dataProvider.getSchedule(termIndex: termIndex)
    }
    
    public func getSchoolInfo() async -> Result<String, Error> {
        return await dataProvider.getSchoolInfo()
    }
    
    public func listReportCards() async -> Result<String, Error> {
        return await dataProvider.listReportCards()
    }
    
    public func getReportCard(documentGUID: String) async -> Result<String, Error> {
        return await dataProvider.getReportCard(documentGUID: documentGUID)
    }
    
    public func listDocuments() async -> Result<String, Error> {
        return await dataProvider.listDocuments()
    }
    
    public func getDocument(documentGUID: String) async -> Result<String, Error> {
        return await dataProvider.getDocument(documentGUID: documentGUID)
    }
    
    public func getDistrictList(zip: String) async -> Result<[DistrictInfo], Error> {
        return await dataProvider.getDistrictList(zip: zip)
    }
    
    public func getMailInboxCount() async -> Result<String, Error> {
        return await dataProvider.getMailInboxCount()
    }
    
    public func verifyCredentials() async -> Result<Bool, Error> {
        return await dataProvider.verifyCredentials()
    }
}
