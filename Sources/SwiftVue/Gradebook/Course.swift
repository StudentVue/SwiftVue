//
//  Course.swift
//
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Course: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var title: String
    public var room: String
    public var staff: String
    public var staffEmail: String
    public var marks: [Mark]
    
    public init(id: UUID = UUID(), period: String, title: String, room: String, staff: String, staffEmail: String, marks: [Mark]) {
        self.id = id
        self.period = period
        self.title = title
        self.room = room
        self.staff = staff
        self.staffEmail = staffEmail
        self.marks = marks
    }
    
    public static func sample() -> Course {
        return PreviewData.course1Sem1
    }
}
