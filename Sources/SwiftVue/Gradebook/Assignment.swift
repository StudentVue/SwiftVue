//
//  Assignment.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Assignment: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var type: String
    public var date: String
    public var due: String
    public var score: String
    public var scoreType: String
    public var points: String
    public var notes: String
    public var description: String
    public var resources: [Resource]
    
    public init(id: UUID = UUID(), name: String, type: String, date: String, due: String, score: String, scoreType: String, points: String, notes: String, description: String, resources: [Resource]) {
        self.id = id
        self.name = name
        self.type = type
        self.date = date
        self.due = due
        self.score = score
        self.scoreType = scoreType
        self.points = points
        self.notes = notes
        self.description = description
        self.resources = resources
    }
    
    public static func sample() -> Assignment {
        return PreviewData.course1Sem1Assignment1
    }
}
