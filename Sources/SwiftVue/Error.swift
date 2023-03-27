//
//  Error.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public enum SwiftVueError: LocalizedError {
    case networkError // Bad or no HTTP response
    case decodingError // Bad decoding of utf data from HTTP response
    case credentialError // Wrong credentials
    case xmlParsingError // XML parsing failed
    case urlError
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .networkError:
            return "Networking Error"
        case .decodingError:
            return "Decoding Error"
        case .credentialError:
            return "Credential Error"
        case .xmlParsingError:
            return "XML Parsing Error"
        case .urlError:
            return "URL Error"
        case .unknown:
            return "Unknown Error"
        }
    }
}
