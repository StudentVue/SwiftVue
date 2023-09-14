//
//  ReportingPeriod.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ReportingPeriod: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var startDate: String
    public var endDate: String
    
    public init(id: UUID = UUID(), name: String, startDate: String, endDate: String) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public static func sample() -> ReportingPeriod {
        return PreviewData.reportingPeriod1
    }
}
