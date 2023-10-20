//
//  Dentist.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Dentist: Hashable, Codable, Identifiable {
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
}
