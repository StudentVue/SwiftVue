//
//  ClassInfo.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ClassInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var className: String
    public var startTime: String
    public var endTime: String
    public var teacher: String
    public var roomName: String
    public var teacherEmail: String
    public var endDate: String
    public var startDate: String
    
    public init(id: UUID = UUID(), period: String, className: String, startTime: String, endTime: String, teacher: String, roomName: String, teacherEmail: String, endDate: String, startDate: String) {
        self.id = id
        self.period = period
        self.className = className
        self.startTime = startTime
        self.endTime = endTime
        self.teacher = teacher
        self.roomName = roomName
        self.teacherEmail = teacherEmail
        self.endDate = endDate
        self.startDate = startDate
    }
    
    public static func sample() -> ClassInfo {
        return PreviewData.classInfo1
    }
}
