//
//  DistrictInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct DistrictInfo: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
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
    
    public static func sample() -> DistrictInfo {
        return sampleDistrictInfo
    }
}

public class DistrictInfoParser: NSObject, XMLParserDelegate {
    private var districtInfos: [DistrictInfo] = []
    private var parser: XMLParser
    
    public init(string: String) {
        parser = XMLParser(data: string.data(using: .utf8) ?? Data())
        super.init()
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "DistrictInfo":
            districtInfos.append(DistrictInfo(districtID: attributes["DistrictID"] ?? "Error", name: attributes["Name"] ?? "Error", address: attributes["Address"] ?? "Error", url: attributes["PvueURL"] ?? "https://error.com"))
        default:
            return
        }
    }
    
    public func parse() -> Result<[DistrictInfo], Error> {
        parser.parse()
        return .success(districtInfos)
    }
}
