//
//  PeriodTotal.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct PeriodTotal: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
    public var number: String
    public var total: String
}
