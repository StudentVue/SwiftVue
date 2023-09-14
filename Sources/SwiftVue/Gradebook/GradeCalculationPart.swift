//
//  GradeCalculationPart.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct GradeCalculationPart: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var weight: String
    public var points: String
    public var pointsPossible: String
    public var calculatedMark: String
    
    public var weightedPct: String
    
    public init(id: UUID = UUID(), name: String, weight: String, points: String, pointsPossible: String, calculatedMark: String, weightedPct: String) {
        self.id = id
        self.name = name
        self.weight = weight
        self.points = points
        self.pointsPossible = pointsPossible
        self.calculatedMark = calculatedMark
        self.weightedPct = weightedPct
    }
    
    public static func sample() -> GradeCalculationPart {
        return PreviewData.course1GradeCalculationPart1
    }
}
