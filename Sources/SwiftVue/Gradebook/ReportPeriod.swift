//
//  ReportPeriod.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ReportPeriod: Hashable, Codable, Identifiable {
    public var id: UUID
    public var index: String
    public var name: String
    public var startDate: String
    public var endDate: String
    
    public init(id: UUID = UUID(), index: String, name: String, startDate: String, endDate: String) {
        self.id = id
        self.index = index
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
    
    public static let preview: ReportPeriod = PreviewData.reportPeriod1
}
