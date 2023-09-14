//
//  ClassListing.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ClassListing: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var courseTitle: String
    public var roomName: String
    public var teacher: String
    public var teacherEmail: String
    
    public init(id: UUID = UUID(), period: String, courseTitle: String, roomName: String, teacher: String, teacherEmail: String) {
        self.id = id
        self.period = period
        self.courseTitle = courseTitle
        self.roomName = roomName
        self.teacher = teacher
        self.teacherEmail = teacherEmail
    }
    
    public static func sample() -> ClassListing {
        return PreviewData.classListing1
    }
}
