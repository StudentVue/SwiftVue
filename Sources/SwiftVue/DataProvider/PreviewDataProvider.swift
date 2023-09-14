//
//  PreviewDataProvider.swift
//  
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public class PreviewDataProvider: DataProvider {
    private let validCredentials: Bool
    
    public init(credentials: Credentials = Credentials.previewCredentials) {
        self.validCredentials = credentials == Credentials.previewCredentials
    }
    
    public init(username: String, password: String, districtURL: String) {
        self.validCredentials = Credentials(username: username, password: password, districtURL: districtURL) == Credentials.previewCredentials
    }
    
    public func getMessages() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getCalendar() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getAttendance() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getGradebook(reportPeriod: Int?) async -> Result<Gradebook, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        switch reportPeriod {
        case 0: return .success(PreviewData.gradebook1)
        case 1: return .success(PreviewData.gradebook2)
        case 2: return .success(PreviewData.gradebook3)
        case 3: return .success(PreviewData.gradebook4)
        default: return .failure(SwiftVueError.noData)
        }
    }
    
    public func getClassNotes() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getStudentInfo() async -> Result<StudentInfo, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .success(PreviewData.student1)
    }
    
    public func getSchedule(termIndex: Int?) async -> Result<Schedule, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        switch termIndex {
        case 0: return .success(PreviewData.schedule1)
        case 1: return .success(PreviewData.schedule2)
        default: return .failure(SwiftVueError.noData)
        }
    }
    
    public func getSchoolInfo() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func listReportCards() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getReportCard(documentGUID: String) async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func listDocuments() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getDocument(documentGUID: String) async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .failure(SwiftVueError.noData)
    }
    
    public func getDistrictList(zip: String) async -> Result<[DistrictInfo], Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .success(PreviewData.districtList1)
    }
    
    public func getMailInboxCount() async -> Result<String, Error> {
        guard validCredentials else { return .failure(SwiftVueError.credentialError) }
        return .success("SynergyMailInboxCountXML")
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
