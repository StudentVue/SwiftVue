//
//  DocumentInfo.swift
//
//
//  Created by Evan Kaneshige on 12/14/23.
//

import Foundation

public struct DocumentInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var documentGU: String
    public var name: String
    public var date: Date
    public var type: String
    public var comment: String
    
    init(id: UUID = UUID(), documentGU: String, name: String, date: Date, type: String, comment: String) {
        self.id = id
        self.documentGU = documentGU
        self.name = name
        self.date = date
        self.type = type
        self.comment = comment
    }
    
    internal init?(attributes: [String: String]) {
        guard let documentGUAttribute = attributes["DocumentGU"],
              let nameAttribute = attributes["DocumentFileName"],
              let dateAttribute = attributes["DocumentDate"],
              let typeAttribute = attributes["DocumentType"],
              let commentAttribute = attributes["DocumentComment"] else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/y"
        
        guard let date = dateFormatter.date(from: dateAttribute) else {
            return nil
        }
        
        self.init(documentGU: documentGUAttribute, name: nameAttribute, date: date, type: typeAttribute, comment: commentAttribute)
    }
}
