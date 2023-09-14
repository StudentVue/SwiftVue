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
    public var termIndex: String
    public var termIndexName: String
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    
    public init(id: UUID = UUID(), schoolName: String, termIndex: String, termIndexName: String, classLists: [ClassListing], termLists: [TermListing]) {
        self.id = id
        self.schoolName = schoolName
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.classLists = classLists
        self.termLists = termLists
    }
    
    public static func sample() -> ConcurrentClassSchedule {
        return PreviewData.concurrentClassSchedule1
    }
}
