//
//  TermListing.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct TermListing: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termIndex: Int
    public var termCode: String
    public var termName: String
    public var beginDate: Date
    public var endDate: Date
    public var termDefCodes: [TermDefCode]
    
    public init(id: UUID = UUID(), termIndex: Int, termCode: String, termName: String, beginDate: Date, endDate: Date, termDefCodes: [TermDefCode]) {
        self.id = id
        self.termIndex = termIndex
        self.termCode = termCode
        self.termName = termName
        self.beginDate = beginDate
        self.endDate = endDate
        self.termDefCodes = termDefCodes
    }
    
    public static let preview: TermListing = PreviewData.termListing1
    
    internal init?(attributes: [String: String]) {
        guard let termIndexAttribute = attributes["TermIndex"],
              let termCodeAttribute = attributes["TermCode"],
              let termNameAttribute = attributes["TermName"],
              let beginDateAttribute = attributes["BeginDate"],
              let endDateAttribute = attributes["EndDate"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        do {
            let termIndex = try Int(termIndexAttribute, format: .number)
            
            guard let beginDate = dateFormatter.date(from: beginDateAttribute),
                  let endDate = dateFormatter.date(from: endDateAttribute) else {
                return nil
            }
            
            self.init(termIndex: termIndex, termCode: termCodeAttribute, termName: termNameAttribute, beginDate: beginDate, endDate: endDate, termDefCodes: [])
        } catch {
            return nil
        }
    }
}
