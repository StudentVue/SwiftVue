//
//  Course.swift
//
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Course: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var period: Int
    public var title: String
    public var room: String
    public var staff: String
    public var staffEmail: String
    public var marks: [Mark]
    
    public init(id: UUID = UUID(), period: Int, title: String, room: String, staff: String, staffEmail: String, marks: [Mark]) {
        self.id = id
        self.period = period
        self.title = title
        self.room = room
        self.staff = staff
        self.staffEmail = staffEmail
        self.marks = marks
    }
    
    public static let preview: Course = PreviewData.course1Sem1
    
    internal init?(attributes: [String: String]) {
        guard let periodAttribute = attributes["Period"],
              let titleAttribute = attributes["Title"],
              let roomAttribute = attributes["Room"],
              let staffAttribute = attributes["Staff"],
              let staffEmailAttribute = attributes["StaffEMail"] else {
            return nil
        }
        
        do {
            let period = try Int(periodAttribute, format: .number)
            
            self.init(period: period, title: titleAttribute, room: roomAttribute, staff: staffAttribute, staffEmail: staffEmailAttribute, marks: [])
        } catch {
            return nil
        }
    }
}
