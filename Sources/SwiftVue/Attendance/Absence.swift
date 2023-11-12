//
//  Absence.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Absence: Hashable, Codable, Identifiable {
    public var id: UUID
    public var absenceDate: Date
    public var reason: String
    public var note: String
    public var dailyIconName: String
    public var codeAllDayReasonType: String
    public var codeAllDayDescription: String
    public var periods: [Period]
    
    public init(id: UUID = UUID(), absenceDate: Date, reason: String, note: String, dailyIconName: String, codeAllDayReasonType: String, codeAllDayDescription: String, periods: [Period]) {
        self.id = id
        self.absenceDate = absenceDate
        self.reason = reason
        self.note = note
        self.dailyIconName = dailyIconName
        self.codeAllDayReasonType = codeAllDayReasonType
        self.codeAllDayDescription = codeAllDayDescription
        self.periods = periods
    }
    
    internal init?(attributes: [String: String]) {
        guard let absenceDateAttribute = attributes["AbsenceDate"],
              let reasonAttribute = attributes["Reason"],
              let noteAttribute = attributes["Note"],
              let dailyIconNameAttribute = attributes["DailyIconName"],
              let codeAllDayReasonTypeAttribute = attributes["CodeAllDayReasonType"],
              let codeAllDayDescriptionAttribute = attributes["CodeAllDayDescription"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        guard let absenceDate = dateFormatter.date(from: absenceDateAttribute) else {
            return nil
        }
        
        self.init(absenceDate: absenceDate, reason: reasonAttribute, note: noteAttribute, dailyIconName: dailyIconNameAttribute, codeAllDayReasonType: codeAllDayReasonTypeAttribute, codeAllDayDescription: codeAllDayDescriptionAttribute, periods: [])
    }
}
