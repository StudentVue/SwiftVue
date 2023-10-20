//
//  Schedule.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Schedule: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termIndex: String
    public var termIndexName: String
    public var todaySchedule: TodayScheduleInfoData
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    public var concurrentClassSchedules: [ConcurrentClassSchedule]
    
    public init(id: UUID = UUID(), termIndex: String, termIndexName: String, todaySchedule: TodayScheduleInfoData, classLists: [ClassListing], termLists: [TermListing], concurrentClassSchedules: [ConcurrentClassSchedule]) {
        self.id = id
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.todaySchedule = todaySchedule
        self.classLists = classLists
        self.termLists = termLists
        self.concurrentClassSchedules = concurrentClassSchedules
    }
    
    public static let preview: Schedule = PreviewData.schedule1
}
