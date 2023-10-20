//
//  PreviewDataProvider.swift
//  
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public class PreviewDataProvider: DataProvider {
    private let validCredentials: Bool
    
    public init(credentials: Credentials = Credentials.preview) {
        self.validCredentials = credentials == Credentials.preview
    }
    
    public init(username: String, password: String, districtURL: String) {
        self.validCredentials = Credentials(username: username, password: password, districtURL: districtURL) == Credentials.preview
    }
    
    public func getMessages() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Messages")
    }
    
    public func getCalendar() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Calendar")
    }
    
    public func getAttendance() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Attendance")
    }
    
    public func getGradebook(reportPeriod: Int?) async throws -> Gradebook {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        switch reportPeriod {
        case 0: return PreviewData.gradebook1
        case 1: return PreviewData.gradebook2
        case 2: return PreviewData.gradebook3
        case 3: return PreviewData.gradebook4
        default: throw SwiftVueError.noData
        }
    }
    
    public func getClassNotes() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Class Notes")
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        return PreviewData.student1
    }
    
    public func getSchedule(termIndex: Int?) async throws -> Schedule {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        switch termIndex {
        case 0: return PreviewData.schedule1
        case 1: return PreviewData.schedule2
        default: throw SwiftVueError.noData
        }
    }
    
    public func getSchoolInfo() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("School Info")
    }
    
    public func listReportCards() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("List Report Cards")
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Get Report Card")
    }
    
    public func listDocuments() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("List Documents")
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("Get Document")
    }
    
    public func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        return PreviewData.districtList1
    }
    
    public func getMailInboxCount() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        return "SynergyMailInboxCountXML"
    }
    
    public func verifyCredentials() async throws -> Bool {
        return validCredentials
    }
}
