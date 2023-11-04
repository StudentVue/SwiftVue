//
//  ClassInfo.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ClassInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: Int
    public var className: String
    public var startTime: Date
    public var endTime: Date
    public var teacher: String
    public var roomName: String
    public var teacherEmail: String
    public var endDate: Date
    public var startDate: Date
    
    public init(id: UUID = UUID(), period: Int, className: String, startTime: Date, endTime: Date, teacher: String, roomName: String, teacherEmail: String, endDate: Date, startDate: Date) {
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
    
    public static let preview: ClassInfo = PreviewData.classInfo1
    
    internal init?(attributes: [String: String]) {
        guard let periodAttribute = attributes["Period"],
              let classNameAttribute = attributes["ClassName"],
              let startTimeAttribute = attributes["StartTime"],
              let endTimeAttribute = attributes["EndTime"],
              let teacherAttribute = attributes["TeacherName"],
              let roomNameAttribute = attributes["RoomName"],
              let teacherEmailAttribute = attributes["TeacherEmail"],
              let endDateAttribute = attributes["EndDate"],
              let startDateAttribute = attributes["StartDate"] else {
            return nil
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_US_POSIX")
        timeFormatter.dateFormat = "h:mm a"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "M/d/y h:mm:ss a"
        
        guard let startTime = timeFormatter.date(from: startTimeAttribute),
              let endTime = timeFormatter.date(from: endTimeAttribute),
              let startDate = dateFormatter.date(from: startDateAttribute),
              let endDate = dateFormatter.date(from: endDateAttribute) else {
            return nil
        }
        
        do {
            let period = try Int(periodAttribute, format: .number)
            
            self.init(period: period, className: classNameAttribute, startTime: startTime, endTime: endTime, teacher: teacherAttribute, roomName: roomNameAttribute, teacherEmail: teacherEmailAttribute, endDate: endDate, startDate: startDate)
        } catch {
            return nil
        }
    }
}
