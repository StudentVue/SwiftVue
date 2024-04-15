//
//  PeriodTotal.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct PeriodTotal: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var number: Int
    public var total: Int
    
    public init(id: UUID = UUID(), number: Int, total: Int) {
        self.id = id
        self.number = number
        self.total = total
    }
    
    internal init?(attributes: [String: String]) {
        guard let numberAttribute = attributes["Number"],
              let totalAttribute = attributes["Total"] else {
            return nil
        }
        
        do {
            let number = try Int(numberAttribute, format: .number)
            let total = try Int(totalAttribute, format: .number)
            
            self.init(number: number, total: total)
        } catch {
            return nil
        }
    }
}
