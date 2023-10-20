//
//  TodayScheduleInfoData.swift
//
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct TodayScheduleInfoData: Hashable, Codable, Identifiable {
    public var id: UUID
    public var date: String
    public var schoolInfos: [SchoolInfo]
    
    public init(id: UUID = UUID(), date: String, schoolInfos: [SchoolInfo]) {
        self.id = id
        self.date = date
        self.schoolInfos = schoolInfos
    }
    
    public static let preview: TodayScheduleInfoData = PreviewData.todaySchedule1
}
