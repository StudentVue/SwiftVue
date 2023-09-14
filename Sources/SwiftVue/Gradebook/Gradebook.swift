//
//  Gradebook.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Gradebook: Hashable, Codable, Identifiable {
    public var id: UUID
    public var reportingPeriods: [ReportPeriod]
    public var reportingPeriod: ReportingPeriod
    public var courses: [Course]
    
    public init(id: UUID = UUID(), reportingPeriods: [ReportPeriod], reportingPeriod: ReportingPeriod, courses: [Course]) {
        self.id = id
        self.reportingPeriods = reportingPeriods
        self.reportingPeriod = reportingPeriod
        self.courses = courses
    }
    
    public static func sample() -> Gradebook {
        return PreviewData.gradebook1
    }
}
