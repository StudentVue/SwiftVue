//
//  Error.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public enum SwiftVueError: Error {
    case invalidResponse
    case couldNotDecodeResponse
    case invalidCredentials
    case couldNotParseXML
    case invalidURL
    case unknown
    case noData
    case notImplemented(String)
    case other(String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response"
        case .couldNotDecodeResponse:
            return "Could not decode response"
        case .invalidCredentials:
            return "Invalid credentials"
        case .couldNotParseXML:
            return "Failed to parse XML"
        case .invalidURL:
            return "URL Error"
        case .unknown:
            return "Unknown"
        case .noData:
            return "No data"
        case .notImplemented(let feature):
            return "\(feature) not implemented"
        case .other(let message):
            return message
        }
    }
    
    public static func error(from message: String?) -> SwiftVueError {
        guard let message else {
            return .unknown
        }
        
        if message.hasPrefix("Invalid user id or password") {
            return .invalidCredentials
        } else {
            return .other(message)
        }
    }
}
