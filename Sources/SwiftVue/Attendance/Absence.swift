//
//  Absence.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Absence: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
    public var absenceDate: String
    public var reason: String
    public var note: String
    public var dailyIconName: String
    public var codeAllDayReasonType: String
    public var codeAllDayDescription: String
    public var periods: [Period]
}
