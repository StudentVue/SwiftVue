//
//  Resource.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Resource: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var description: String
    public var name: String
    public var type: String
    public var url: String?
    
    public init(id: UUID = UUID(), description: String, name: String, type: String, url: String?) {
        self.id = id
        self.description = description
        self.name = name
        self.type = type
        self.url = url
    }
    
    internal init?(attributes: [String: String]) {
        guard let descriptionAttribute = attributes["ResourceDescription"],
              let nameAttribute = attributes["ResourceName"],
              let typeAttribute = attributes["Type"] else {
            return nil
        }
        
        self.init(description: descriptionAttribute, name: nameAttribute, type: typeAttribute, url: attributes["URL"])
    }
}
