//
//  ReportPeriod.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ReportPeriod: Hashable, Codable, Identifiable {
    public var id: UUID
    public var index: Int
    public var name: String
    public var startDate: Date
    public var endDate: Date
    
    public init(id: UUID = UUID(), index: Int, name: String, startDate: Date, endDate: Date) {
        self.id = id
        self.index = index
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public static let preview: ReportPeriod = PreviewData.reportPeriod1
    
    internal init?(attributes: [String: String]) {
        guard let indexAttribute = attributes["Index"],
              let nameAttribute = attributes["GradePeriod"],
              let startDateAttribute = attributes["StartDate"],
              let endDateAttribute = attributes["EndDate"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "M/d/y"
        do {
            let index = try Int(indexAttribute, format: .number)
            
            guard let startDate = dateFormatter.date(from: startDateAttribute),
                  let endDate = dateFormatter.date(from: endDateAttribute) else {
                return nil
            }
            
            self.init(index: index, name: nameAttribute, startDate: startDate, endDate: endDate)
        } catch {
            return nil
        }
    }
}
