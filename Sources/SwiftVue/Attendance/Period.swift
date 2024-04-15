//
//  Period.swift
//  
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Period: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var number: Int
    public var name: String
    public var reason: String
    public var course: String
    public var staff: String
    public var staffEmail: String
    public var iconName: String
    public var schoolName: String
    
    public init(id: UUID = UUID(), number: Int, name: String, reason: String, course: String, staff: String, staffEmail: String, iconName: String, schoolName: String) {
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
    
    internal init?(attributes: [String: String]) {
        guard let numberAttribute = attributes["Number"],
              let nameAttribute = attributes["Name"],
              let reasonAttribute = attributes["Reason"],
              let courseAttribute = attributes["Course"],
              let staffAttribute = attributes["Staff"],
              let staffEmailAttribute = attributes["StaffEMail"],
              let iconNameAttribute = attributes["IconName"],
              let schoolNameAttribute = attributes["SchoolName"] else {
            return nil
        }
        
        do {
            let number = try Int(numberAttribute, format: .number)
            
            self.init(number: number, name: nameAttribute, reason: reasonAttribute, course: courseAttribute, staff: staffAttribute, staffEmail: staffEmailAttribute, iconName: iconNameAttribute, schoolName: schoolNameAttribute)
        } catch {
            return nil
        }
    }
}
