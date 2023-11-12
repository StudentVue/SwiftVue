//
//  ConcurrentClassSchedule.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct ConcurrentClassSchedule: Hashable, Codable, Identifiable {
    public var id: UUID
    public var schoolName: String
    public var termIndex: Int
    public var termIndexName: String
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    
    public init(id: UUID = UUID(), schoolName: String, termIndex: Int, termIndexName: String, classLists: [ClassListing], termLists: [TermListing]) {
        self.id = id
        self.schoolName = schoolName
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.classLists = classLists
        self.termLists = termLists
    }
    
    public static let preview: ConcurrentClassSchedule = PreviewData.concurrentClassSchedule1
    
    internal init?(attributes: [String: String]) {
        guard let schoolNameAttribute = attributes["SchoolName"],
              let termIndexAttribute = attributes["ConSchTermIndex"],
              let termIndexNameAttribute = attributes["ConSchTermIndexName"] else {
            return nil
        }
        
        do {
            let termIndex = try Int(termIndexAttribute, format: .number)
            
            self.init(schoolName: schoolNameAttribute, termIndex: termIndex, termIndexName: termIndexNameAttribute, classLists: [], termLists: [])
        } catch {
            return nil
        }
    }
}
