//
//  PeriodTotal.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct PeriodTotal: Hashable, Codable, Identifiable {
    public var id: UUID
    public var number: String
    public var total: String
    
    public init(id: UUID = UUID(), number: String, total: String) {
        self.id = id
        self.number = number
        self.total = total
    }
}
