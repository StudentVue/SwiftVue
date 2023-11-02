//
//  Attendance.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Attendance: Hashable, Codable, Identifiable {
    public var id: UUID
    public var type: String
    public var startPeriod: String
    public var endPeriod: String
    public var periodCount: String
    public var schoolName: String
    public var absences: [Absence]
    public var totalExcused: [PeriodTotal]
    public var totalTardies: [PeriodTotal]
    public var totalUnexcused: [PeriodTotal]
    public var totalActivities: [PeriodTotal]
    public var TotalUnexcusedTardies: [PeriodTotal]
    
    public init(id: UUID = UUID(), type: String, startPeriod: String, endPeriod: String, periodCount: String, schoolName: String, absences: [Absence], totalExcused: [PeriodTotal], totalTardies: [PeriodTotal], totalUnexcused: [PeriodTotal], totalActivities: [PeriodTotal], TotalUnexcusedTardies: [PeriodTotal]) {
        self.id = id
        self.type = type
        self.startPeriod = startPeriod
        self.endPeriod = endPeriod
        self.periodCount = periodCount
        self.schoolName = schoolName
        self.absences = absences
        self.totalExcused = totalExcused
        self.totalTardies = totalTardies
        self.totalUnexcused = totalUnexcused
        self.totalActivities = totalActivities
        self.TotalUnexcusedTardies = TotalUnexcusedTardies
    }
}
