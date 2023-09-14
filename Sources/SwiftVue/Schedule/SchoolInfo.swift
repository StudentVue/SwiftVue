//
//  SchoolInfo.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct SchoolInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var bellScheduleName: String
    public var classes: [ClassInfo]
    
    public init(id: UUID = UUID(), name: String, bellScheduleName: String, classes: [ClassInfo]) {
        self.id = id
        self.name = name
        self.bellScheduleName = bellScheduleName
        self.classes = classes
    }
    
    public static func sample() -> SchoolInfo {
        return PreviewData.schoolInfo1
    }
}
