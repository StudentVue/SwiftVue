//
//  DataProvider.swift
//
//
//  Created by Evan Kaneshige on 9/14/23.
//

import Foundation

public protocol DataProvider {
    func getMessages() async -> Result<String, Error>
    func getCalendar() async -> Result<String, Error>
    func getAttendance() async -> Result<String, Error>
    func getGradebook(reportPeriod: Int?) async -> Result<Gradebook, Error>
    func getClassNotes() async -> Result<String, Error>
    func getStudentInfo() async -> Result<StudentInfo, Error>
    func getSchedule(termIndex: Int?) async -> Result<Schedule, Error>
    func getSchoolInfo() async -> Result<String, Error>
    func listReportCards() async -> Result<String, Error>
    func getReportCard(documentGUID: String) async -> Result<String, Error>
    func listDocuments() async -> Result<String, Error>
    func getDocument(documentGUID: String) async -> Result<String, Error>
    func getDistrictList(zip: String) async -> Result<[DistrictInfo], Error>
    func getMailInboxCount() async -> Result<String, Error>
    func verifyCredentials() async -> Result<Bool, Error>
}
