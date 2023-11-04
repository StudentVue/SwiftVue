//
//  TermDefCode.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public struct TermDefCode: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termDefName: String
    
    public init(id: UUID = UUID(), termDefName: String) {
        self.id = id
        self.termDefName = termDefName
    }
    
    internal init?(attributes: [String: String]) {
        guard let termDefNameAttribute = attributes["TermDefName"] else {
            return nil
        }
        
        self.init(termDefName: termDefNameAttribute)
    }
}
