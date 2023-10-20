//
//  Mark.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct Mark: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var scoreString: String
    public var scoreRaw: String
    public var gradeCalculationSumary: [GradeCalculationPart]
    public var assignments: [Assignment]
    
    public init(id: UUID = UUID(), name: String, scoreString: String, scoreRaw: String, gradeCalculationSumary: [GradeCalculationPart], assignments: [Assignment]) {
        self.id = id
        self.name = name
        self.scoreString = scoreString
        self.scoreRaw = scoreRaw
        self.gradeCalculationSumary = gradeCalculationSumary
        self.assignments = assignments
    }
    
    public static let preview: Mark = PreviewData.course1Sem1Mark1
}
