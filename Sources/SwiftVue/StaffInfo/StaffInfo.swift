//
//  StaffInfo.swift
//
//
//  Created by Evan Kaneshige on 12/15/23.
//

import Foundation

public struct StaffInfo: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var name: String
    public var email: String
    public var title: String
    public var phone: String
    public var extn: String
    
    public init(id: UUID = UUID(), name: String, email: String, title: String, phone: String, extn: String) {
        self.id = id
        self.name = name
        self.email = email
        self.title = title
        self.phone = phone
        self.extn = extn
    }
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["Name"],
              let emailAttribute = attributes["EMail"],
              let titleAttribute = attributes["Title"],
              let phoneAttribute = attributes["Phone"],
              let extnAttribute = attributes["Extn"] else {
            return nil
        }
        
        self.init(name: nameAttribute, email: emailAttribute, title: titleAttribute, phone: phoneAttribute, extn: extnAttribute)
    }
}
