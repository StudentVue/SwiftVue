//
//  Period.swift
//  
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public struct Period: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
    public var number: String
    public var name: String
    public var reason: String
    public var course: String
    public var staff: String
    public var staffEmail: String
    public var iconName: String
    public var schoolName: String
}
