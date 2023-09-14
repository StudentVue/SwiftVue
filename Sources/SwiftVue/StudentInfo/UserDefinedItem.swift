//
//  UserDefinedItem.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct UserDefinedItem: Hashable, Codable, Identifiable {
    public var id: UUID
    public var itemLabel: String
    public var value: String
    
    public init(id: UUID = UUID(), itemLabel: String, value: String) {
        self.id = id
        self.itemLabel = itemLabel
        self.value = value
    }
    
    public static func sample() -> UserDefinedItem {
        return PreviewData.useDefinedItem1
    }
}
