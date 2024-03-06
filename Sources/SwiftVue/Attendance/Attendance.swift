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
    public var periodCount: Int
    public var schoolName: String
    public var absences: [Absence]
    public var totalExcused: [PeriodTotal]
    public var totalTardies: [PeriodTotal]
    public var totalUnexcused: [PeriodTotal]
    public var totalActivities: [PeriodTotal]
    public var totalUnexcusedTardies: [PeriodTotal]
    
    public init(id: UUID = UUID(), type: String, startPeriod: String, endPeriod: String, periodCount: Int, schoolName: String, absences: [Absence], totalExcused: [PeriodTotal], totalTardies: [PeriodTotal], totalUnexcused: [PeriodTotal], totalActivities: [PeriodTotal], totalUnexcusedTardies: [PeriodTotal]) {
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
        self.totalUnexcusedTardies = totalUnexcusedTardies
    }
    
    internal init?(attributes: [String: String]) {
        guard let typeAttribute = attributes["Type"],
              let startPeriodAttribute = attributes["StartPeriod"],
              let endPeriodAttribute = attributes["EndPeriod"],
              let periodCountAttribute = attributes["PeriodCount"],
              let schoolNameAttribute = attributes["SchoolName"] else {
            return nil
        }
        
        do {
            let periodCount = try Int(periodCountAttribute, format: .number)
            
            self.init(type: typeAttribute, startPeriod: startPeriodAttribute, endPeriod: endPeriodAttribute, periodCount: periodCount, schoolName: schoolNameAttribute, absences: [], totalExcused: [], totalTardies: [], totalUnexcused: [], totalActivities: [], totalUnexcusedTardies: [])
        } catch {
            return nil
        }
    }
}
