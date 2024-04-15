//
//  TodayScheduleInfoData.swift
//
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct TodayScheduleInfoData: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var date: Date?
    public var schoolInfos: [SchoolInfo]
    
    public init(id: UUID = UUID(), date: Date?, schoolInfos: [SchoolInfo]) {
        self.id = id
        self.date = date
        self.schoolInfos = schoolInfos
    }
    
    public static let preview: TodayScheduleInfoData = PreviewData.todaySchedule1
    
    internal init?(attributes: [String: String]) {
        if let dateAttribute = attributes["Date"] {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "MM/dd/y"
            
            if let date = dateFormatter.date(from: dateAttribute) {
                self.init(date: date, schoolInfos: [])
            } else {
                self.init(date: nil, schoolInfos: [])
            }
        } else {
            self.init(date: nil, schoolInfos: [])
        }
    }
}
