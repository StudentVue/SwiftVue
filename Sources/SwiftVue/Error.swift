//
//  Error.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public enum SwiftVueError: Error {
    case networkError // Bad or no HTTP response
    case decodingError // Bad decoding of utf data from HTTP response
    case credentialError // Wrong credentials
    case xmlParsingError // XML parsing failed
    case urlError
    case unknown
}
