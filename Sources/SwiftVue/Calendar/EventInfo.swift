//
//  EventInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/14/23.
//

import Foundation

public struct EventInfo: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var date: Date
    public var title: String
    public var dayType: String
    
    public init(id: UUID = UUID(), date: Date, title: String, dayType: String) {
        self.id = id
        self.date = date
        self.title = title
        self.dayType = dayType
    }
    
    internal init?(attributes: [String: String]) {
        guard let dateAttribute = attributes["Date"],
              let titleAttribute = attributes["Title"],
              let dayTypeAttribute = attributes["DayType"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        guard let date = dateFormatter.date(from: dateAttribute) else {
            return nil
        }
        
        self.init(date: date, title: titleAttribute, dayType: dayTypeAttribute)
    }
}
