//
//  Credentials.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Credentials: Hashable, Codable {
    public init(username: String, password: String, districtURL: String) {
        self.username = username
        self.password = password
        self.districtURL = districtURL
    }
    
    public var username: String
    public var password: String
    public var districtURL: String
    
    public static let preview: Credentials = Credentials(username: "myUs3rname", password: "myP@ssword", districtURL: "myD1strict")
}
