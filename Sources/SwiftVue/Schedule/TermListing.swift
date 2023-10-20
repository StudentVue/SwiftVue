//
//  TermListing.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct TermListing: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termIndex: String
    public var termCode: String
    public var termName: String
    public var beginDate: String
    public var endDate: String
    public var termDefCodes: [TermDefCode]
    
    public init(id: UUID = UUID(), termIndex: String, termCode: String, termName: String, beginDate: String, endDate: String, termDefCodes: [TermDefCode]) {
        self.id = id
        self.termIndex = termIndex
        self.termCode = termCode
        self.termName = termName
        self.beginDate = beginDate
        self.endDate = endDate
        self.termDefCodes = termDefCodes
    }
    
    public static let preview: TermListing = PreviewData.termListing1
}
