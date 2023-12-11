//
//  DataProvider.swift
//
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public protocol DataProvider {
    func getMessages() async throws -> String
    func getCalendar() async throws -> String
    func getAttendance() async throws -> Attendance
    func getGradebook(reportPeriod: Int?) async throws -> Gradebook
    func getClassNotes() async throws -> String
    func getStudentInfo() async throws -> StudentInfo
    func getSchedule(termIndex: Int?) async throws -> Schedule
    func getSchoolInfo() async throws -> String
    func listReportCards() async throws -> String
    func getReportCard(documentGUID: String) async throws -> String
    func listDocuments() async throws -> String
    func getDocument(documentGUID: String) async throws -> String
    func getMailInboxCount() async throws -> String
    func verifyCredentials() async throws -> Bool
    
    static func getDistrictList(zip: String) async throws -> [DistrictInfo]
}
