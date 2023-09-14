//
//  EmergencyContact.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct EmergencyContact: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var relationship: String
    public var homePhone: String
    public var workPhone: String
    public var otherPhone: String
    public var mobilePhone: String
    
    public init(id: UUID = UUID(), name: String, relationship: String, homePhone: String, workPhone: String, otherPhone: String, mobilePhone: String) {
        self.id = id
        self.name = name
        self.relationship = relationship
        self.homePhone = homePhone
        self.workPhone = workPhone
        self.otherPhone = otherPhone
        self.mobilePhone = mobilePhone
    }
    
    public static func sample() -> EmergencyContact {
        return PreviewData.contact1
    }
}
