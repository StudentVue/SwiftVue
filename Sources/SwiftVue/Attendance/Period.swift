//
//  Period.swift
//  
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Period: Hashable, Codable, Identifiable {
    public var id: UUID
    public var number: String
    public var name: String
    public var reason: String
    public var course: String
    public var staff: String
    public var staffEmail: String
    public var iconName: String
    public var schoolName: String
    
    public init(id: UUID = UUID(), number: String, name: String, reason: String, course: String, staff: String, staffEmail: String, iconName: String, schoolName: String) {
        self.id = id
        self.number = number
        self.name = name
        self.reason = reason
        self.course = course
        self.staff = staff
        self.staffEmail = staffEmail
        self.iconName = iconName
        self.schoolName = schoolName
    }
}
