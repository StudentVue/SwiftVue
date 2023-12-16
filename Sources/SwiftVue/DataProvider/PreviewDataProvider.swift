//
//  PreviewDataProvider.swift
//  
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public class PreviewDataProvider: DataProvider {
    public static var delayNanoseconds = UInt64(2e9)
    private let validCredentials: Bool
    
    required public init(credentials: Credentials) {
        self.validCredentials = credentials == Credentials.preview
    }
    
    public func getMessages() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getMessages")
    }
    
    public func getCalendar() async throws -> StudentCalendar {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getCalendar")
    }
    
    public func getAttendance() async throws -> Attendance {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getAttendance")
    }
    
    public func getGradebook(reportPeriod: Int?) async throws -> Gradebook {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        try await Self.delay()
        switch reportPeriod {
        case 0: return PreviewData.gradebook1
        case 1: return PreviewData.gradebook2
        case 2: return PreviewData.gradebook3
        case 3: return PreviewData.gradebook4
        case nil: return PreviewData.gradebook2
        default: throw SwiftVueError.noData
        }
    }
    
    public func getClassNotes() async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getClassNotes")
    }
    
    public func getStudentInfo() async throws -> StudentInfo {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        try await Self.delay()
        return PreviewData.student1
    }
    
    public func getSchedule(termIndex: Int?) async throws -> Schedule {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        try await Self.delay()
        switch termIndex {
        case 0: return PreviewData.schedule1
        case 1: return PreviewData.schedule2
        case nil: return PreviewData.schedule1
        default: throw SwiftVueError.noData
        }
    }
    
    public func getStaffInfo() async throws -> [StaffInfo] {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getSchoolInfo")
    }
    
    public func listReportCards() async throws -> [ReportCardInfo] {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.listReportCards")
    }
    
    public func getReportCard(documentGUID: String) async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getReportCard")
    }
    
    public func listDocuments() async throws -> [DocumentInfo] {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.listDocuments")
    }
    
    public func getDocument(documentGUID: String) async throws -> String {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getDocument")
    }
    
    public func getMailInboxCount() async throws -> MailInboxCount {
        guard validCredentials else { throw SwiftVueError.invalidCredentials }
        throw SwiftVueError.notImplemented("PreviewDataProvider.getMailInboxCount")
    }
    
    public func verifyCredentials() async throws -> Bool {
        return validCredentials
    }
    
    public static func getDistrictList(zip: String) async throws -> [DistrictInfo] {
        try await delay()
        return PreviewData.districtList1
    }
    
    private static func delay() async throws {
        try await Task.sleep(nanoseconds: Self.delayNanoseconds)
    }
}
