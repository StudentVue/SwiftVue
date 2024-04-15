//
//  UserDefinedItem.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct UserDefinedItem: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var itemLabel: String
    public var value: String
    
    public init(id: UUID = UUID(), itemLabel: String, value: String) {
        self.id = id
        self.itemLabel = itemLabel
        self.value = value
    }
    
    public static let preview: UserDefinedItem = PreviewData.useDefinedItem1
    
    internal init?(attributes: [String: String]) {
        guard let itemLabelAttribute = attributes["ItemLabel"],
              let valueAttribute = attributes["Value"] else {
            return nil
        }
        
        self.init(itemLabel: itemLabelAttribute, value: valueAttribute)
    }
}
