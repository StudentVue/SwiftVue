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
    public var startDate: Date
    public var endDate: Date
    
    public init(id: UUID = UUID(), name: String, startDate: Date, endDate: Date) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public static let preview: ReportingPeriod = PreviewData.reportingPeriod1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["GradePeriod"],
              let startDateAttribute = attributes["StartDate"],
              let endDateAttribute = attributes["EndDate"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "M/d/y"
        
        guard let startDate = dateFormatter.date(from: startDateAttribute),
              let endDate = dateFormatter.date(from: endDateAttribute) else {
            return nil
        }
        
        self.init(name: nameAttribute, startDate: startDate, endDate: endDate)
    }
}
