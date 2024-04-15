//
//  DistrictInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct DistrictInfo: Hashable, Codable, Identifiable, Sendable {
    public var id: UUID
    public var districtID: String
    public var name: String
    public var address: String
    public var url: String
    
    public init(id: UUID = UUID(), districtID: String, name: String, address: String, url: String) {
        self.id = id
        self.districtID = districtID
        self.name = name
        self.address = address
        self.url = url
    }
    
    public static let preview: DistrictInfo = PreviewData.districtInfo1
    
    internal init?(attributes: [String: String]) {
        guard let districtIDAttribute = attributes["DistrictID"],
              let nameAttribute = attributes["Name"],
              let addressAttribute = attributes["Address"],
              let urlAttribute = attributes["PvueURL"] else {
            return nil
        }
        
        self.init(districtID: districtIDAttribute, name: nameAttribute, address: addressAttribute, url: urlAttribute)
    }
}
