//
//  Physician.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Physician: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var hospital: String
    public var phone: String
    public var extn: String
    
    public init(id: UUID = UUID(), name: String, hospital: String, phone: String, extn: String) {
        self.id = id
        self.name = name
        self.hospital = hospital
        self.phone = phone
        self.extn = extn
    }
    
    public static let preview: Physician = PreviewData.physician1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["Name"],
              let hospitalAttribute = attributes["Hospital"],
              let phoneAttribute = attributes["Phone"],
              let extnAttribute = attributes["Extn"] else {
            return nil
        }
        
        self.init(name: nameAttribute, hospital: hospitalAttribute, phone: phoneAttribute, extn: extnAttribute)
    }
}
