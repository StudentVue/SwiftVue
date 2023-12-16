//
//  DataProvider.swift
//
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public protocol DataProvider {
    func getMessages() async throws -> String
    func getCalendar() async throws -> StudentCalendar
    func getAttendance() async throws -> Attendance
    func getGradebook(reportPeriod: Int?) async throws -> Gradebook
    func getClassNotes() async throws -> String
    func getStudentInfo() async throws -> StudentInfo
    func getSchedule(termIndex: Int?) async throws -> Schedule
    func getStaffInfo() async throws -> [StaffInfo]
    func listReportCards() async throws -> [ReportCardInfo]
    func getReportCard(documentGUID: String) async throws -> String
    func listDocuments() async throws -> [DocumentInfo]
    func getDocument(documentGUID: String) async throws -> String
    func getMailInboxCount() async throws -> MailInboxCount
    func verifyCredentials() async throws -> Bool
    
    init(credentials: Credentials)
    
    static func getDistrictList(zip: String) async throws -> [DistrictInfo]
}
