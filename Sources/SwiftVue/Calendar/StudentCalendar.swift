//
//  StudentCalendar.swift
//
//
//  Created by Evan Kaneshige on 12/14/23.
//

import Foundation

public struct StudentCalendar: Hashable, Codable, Identifiable {
    public var id: UUID
    public var schoolBeginDate: Date
    public var schoolEndDate: Date
    public var monthBeginDate: Date
    public var monthEndDate: Date
    public var events: [EventInfo]
    
    public init(id: UUID = UUID(), schoolBeginDate: Date, schoolEndDate: Date, monthBeginDate: Date, monthEndDate: Date, events: [EventInfo]) {
        self.id = id
        self.schoolBeginDate = schoolBeginDate
        self.schoolEndDate = schoolEndDate
        self.monthBeginDate = monthBeginDate
        self.monthEndDate = monthEndDate
        self.events = events
    }
    
    internal init?(attributes: [String: String]) {
        guard let schoolBeginDateAttribute = attributes["SchoolBegDate"],
              let schoolEndDateAttribute = attributes["SchoolEndDate"],
              let monthBeginDateAttribute = attributes["MonthBegDate"],
              let monthEndDateAttribute = attributes["MonthEndDate"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        guard let schoolBeginDate = dateFormatter.date(from: schoolBeginDateAttribute),
              let schoolEndDate = dateFormatter.date(from: schoolEndDateAttribute),
              let monthBeginDate = dateFormatter.date(from: monthBeginDateAttribute),
              let monthEndDate = dateFormatter.date(from: monthEndDateAttribute) else {
            return nil
        }
        
        self.init(schoolBeginDate: schoolBeginDate, schoolEndDate: schoolEndDate, monthBeginDate: monthBeginDate, monthEndDate: monthEndDate, events: [])
    }
}
