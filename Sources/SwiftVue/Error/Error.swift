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
        }
    }
}
