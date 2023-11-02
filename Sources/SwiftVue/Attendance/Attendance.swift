//
//  Attendance.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Attendance: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
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
}
