//
//  ReportCardInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/14/23.
//

import Foundation

public struct ReportCardInfo: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var reportingPeriodGU: String
    public var reportingPeriodName: String
    public var endDate: Date
    public var message: String
    public var documentGU: String
    
    init(id: UUID = UUID(), reportingPeriodGU: String, reportingPeriodName: String, endDate: Date, message: String, documentGU: String) {
        self.id = id
        self.reportingPeriodGU = reportingPeriodGU
        self.reportingPeriodName = reportingPeriodName
        self.endDate = endDate
        self.message = message
        self.documentGU = documentGU
    }
    
    internal init?(attributes: [String: String]) {
        guard let reportingPeriodGUAttribute = attributes["ReportingPeriodGU"],
              let reportingPeriodNameAttribute = attributes["ReportingPeriodName"],
              let endDateAttribute = attributes["EndDate"],
              let messageAttribute = attributes["Message"],
              let documentGUAttribute = attributes["DocumentGU"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        guard let endDate = dateFormatter.date(from: endDateAttribute) else {
            return nil
        }
        
        self.init(reportingPeriodGU: reportingPeriodGUAttribute, reportingPeriodName: reportingPeriodNameAttribute, endDate: endDate, message: messageAttribute, documentGU: documentGUAttribute)
    }
}
