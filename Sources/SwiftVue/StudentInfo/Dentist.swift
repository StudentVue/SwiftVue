//
//  Dentist.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Dentist: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var name: String
    public var office: String
    public var phone: String
    public var extn: String
    
    public init(id: UUID = UUID(), name: String, office: String, phone: String, extn: String) {
        self.id = id
        self.name = name
        self.office = office
        self.phone = phone
        self.extn = extn
    }
    
    public static let preview: Dentist = PreviewData.dentist1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["Name"],
              let officeAttribute = attributes["Office"],
              let phoneAttribute = attributes["Phone"],
              let extnAttribute = attributes["Extn"] else {
            return nil
        }
        
        self.init(name: nameAttribute, office: officeAttribute, phone: phoneAttribute, extn: extnAttribute)
    }
}
