//
//  Assignment.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Assignment: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var name: String
    public var type: String
    public var date: Date
    public var due: Date
    public var score: String
    public var scoreType: String
    public var points: String
    public var notes: String
    public var description: String
    public var resources: [Resource]
    
    public init(id: UUID = UUID(), name: String, type: String, date: Date, due: Date, score: String, scoreType: String, points: String, notes: String, description: String, resources: [Resource]) {
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
    
    public static let preview: Assignment = PreviewData.course1Sem1Assignment1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["Measure"],
              let typeAttribute = attributes["Type"],
              let dateAttribute = attributes["Date"],
              let dueAttribute = attributes["DueDate"],
              let scoreAttribute = attributes["Score"],
              let scoreTypeAttribute = attributes["ScoreType"],
              let pointsAttribute = attributes["Points"],
              let notesAttribute = attributes["Notes"],
              let descriptionAttribute = attributes["MeasureDescription"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "M/d/y"
        
        guard let date = dateFormatter.date(from: dateAttribute),
              let due = dateFormatter.date(from: dueAttribute) else {
            return nil
        }
        
        self.init(name: nameAttribute, type: typeAttribute, date: date, due: due, score: scoreAttribute, scoreType: scoreTypeAttribute, points: pointsAttribute, notes: notesAttribute, description: descriptionAttribute, resources: [])
    }
}
