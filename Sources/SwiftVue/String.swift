//
//  String.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

extension String {
    func replacingEscapements() -> String {
        return self.replacingOccurrences(of: "&quot;", with: "'")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&#xD", with: "")
            .replacingOccurrences(of: "&#xA", with: "")
    }
}
