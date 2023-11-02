//
//  DistrictInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct DistrictInfo: Hashable, Codable, Identifiable {
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
}
