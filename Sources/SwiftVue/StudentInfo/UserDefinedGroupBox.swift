//
//  UserDefinedGroupBox.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct UserDefinedGroupBox: Hashable, Codable, Identifiable {
    public var id: UUID
    public var userDefinedItems: [UserDefinedItem]
    
    public init(id: UUID = UUID(), userDefinedItems: [UserDefinedItem]) {
        self.id = id
        self.userDefinedItems = userDefinedItems
    }
}
