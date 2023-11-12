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
    public var weight: Double
    public var points: Double
    public var pointsPossible: Double
    public var calculatedMark: String
    public var weightedPct: Double
    
    public init(id: UUID = UUID(), name: String, weight: Double, points: Double, pointsPossible: Double, calculatedMark: String, weightedPct: Double) {
        self.id = id
        self.name = name
        self.weight = weight
        self.points = points
        self.pointsPossible = pointsPossible
        self.calculatedMark = calculatedMark
        self.weightedPct = weightedPct
    }
    
    public static let preview: GradeCalculationPart = PreviewData.course1GradeCalculationPart1
    
    internal init?(attributes: [String: String]) {
        guard let nameAttribute = attributes["Type"],
              let weightAttribute = attributes["Weight"],
              let pointsAttribute = attributes["Points"],
              let pointsPossibleAttribute = attributes["PointsPossible"],
              let calculatedMarkAttribute = attributes["CalculatedMark"],
              let weightedPctAttribute = attributes["WeightedPct"] else {
            return nil
        }
        
        do {
            let weight = try Double(weightAttribute, format: .percent)
            let points = try Double(pointsAttribute, format: .number)
            let pointsPossible = try Double(pointsPossibleAttribute, format: .number)
            let weightedPct = try Double(weightedPctAttribute, format: .percent)
            
            self.init(name: nameAttribute, weight: weight, points: points, pointsPossible: pointsPossible, calculatedMark: calculatedMarkAttribute, weightedPct: weightedPct)
        } catch {
            return nil
        }
    }
}
