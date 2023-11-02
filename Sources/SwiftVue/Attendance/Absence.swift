//
//  Absence.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Absence: Hashable, Codable, Identifiable {
    public var id: UUID
    public var absenceDate: String
    public var reason: String
    public var note: String
    public var dailyIconName: String
    public var codeAllDayReasonType: String
    public var codeAllDayDescription: String
    public var periods: [Period]
    
    public init(id: UUID = UUID(), absenceDate: String, reason: String, note: String, dailyIconName: String, codeAllDayReasonType: String, codeAllDayDescription: String, periods: [Period]) {
        self.id = id
        self.absenceDate = absenceDate
        self.reason = reason
        self.note = note
        self.dailyIconName = dailyIconName
        self.codeAllDayReasonType = codeAllDayReasonType
        self.codeAllDayDescription = codeAllDayDescription
        self.periods = periods
    }
}
