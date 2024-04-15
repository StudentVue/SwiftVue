//
//  Mark.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Mark: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var name: String
    public var scoreString: String
    public var scoreRaw: Double
    public var gradeCalculationSumary: [GradeCalculationPart]
    public var assignments: [Assignment]
    
    public init(id: UUID = UUID(), name: String, scoreString: String, scoreRaw: Double, gradeCalculationSumary: [GradeCalculationPart], assignments: [Assignment]) {
        self.id = id
        self.name = name
        self.scoreString = scoreString
        self.scoreRaw = scoreRaw
        self.gradeCalculationSumary = gradeCalculationSumary
        self.assignments = assignments
    }
    
    public static let preview: Mark = PreviewData.course1Sem1Mark1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["MarkName"],
              let scoreStringAttribute = attributes["CalculatedScoreString"],
              let scoreRawAttribute = attributes["CalculatedScoreRaw"] else {
            return nil
        }
        
        do {
            let scoreRaw = try Double(scoreRawAttribute, format: .number)
            
            self.init(name: nameAttribute, scoreString: scoreStringAttribute, scoreRaw: scoreRaw, gradeCalculationSumary: [], assignments: [])
        } catch {
            return nil
        }
    }
}
