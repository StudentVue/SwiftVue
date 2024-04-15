//
//  ClassListing.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ClassListing: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var period: Int
    public var courseTitle: String
    public var roomName: String
    public var teacher: String
    public var teacherEmail: String
    
    public init(id: UUID = UUID(), period: Int, courseTitle: String, roomName: String, teacher: String, teacherEmail: String) {
        self.id = id
        self.period = period
        self.courseTitle = courseTitle
        self.roomName = roomName
        self.teacher = teacher
        self.teacherEmail = teacherEmail
    }
    
    public static let preview: ClassListing = PreviewData.classListing1
    
    internal init?(attributes: [String: String]) {
        guard let periodAttribute = attributes["Period"],
              let courseTitleAttribute = attributes["CourseTitle"],
              let roomNameAttribute = attributes["RoomName"],
              let teacherAttribute = attributes["Teacher"],
              let teacherEmailAttribute = attributes["TeacherEmail"] else {
            return nil
        }
        
        do {
            let period = try Int(periodAttribute, format: .number)
            
            self.init(period: period, courseTitle: courseTitleAttribute, roomName: roomNameAttribute, teacher: teacherAttribute, teacherEmail: teacherEmailAttribute)
        } catch {
            return nil
        }
    }
}
