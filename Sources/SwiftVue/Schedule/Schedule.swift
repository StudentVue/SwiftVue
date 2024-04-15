//
//  Schedule.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Schedule: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var termIndex: Int
    public var termIndexName: String
    public var todaySchedule: TodayScheduleInfoData
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    public var concurrentClassSchedules: [ConcurrentClassSchedule]
    
    public init(id: UUID = UUID(), termIndex: Int, termIndexName: String, todaySchedule: TodayScheduleInfoData, classLists: [ClassListing], termLists: [TermListing], concurrentClassSchedules: [ConcurrentClassSchedule]) {
        self.id = id
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.todaySchedule = todaySchedule
        self.classLists = classLists
        self.termLists = termLists
        self.concurrentClassSchedules = concurrentClassSchedules
    }
    
    public static let preview: Schedule = PreviewData.schedule1
    
    internal init?(attributes: [String: String]?, todaySchedule: TodayScheduleInfoData?) {
        guard let termIndexAttribute = attributes?["TermIndex"],
              let termIndexNameAttribute = attributes?["TermIndexName"],
              let todaySchedule else {
            return nil
        }
        
        do {
            let termIndex = try Int(termIndexAttribute, format: .number)
            
            self.init(termIndex: termIndex, termIndexName: termIndexNameAttribute, todaySchedule: todaySchedule, classLists: [], termLists: [], concurrentClassSchedules: [])
        } catch {
            return nil
        }
    }
}
