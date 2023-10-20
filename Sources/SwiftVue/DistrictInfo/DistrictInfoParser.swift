//
//  DistrictInfoParser.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public class DistrictInfoParser: NSObject, XMLParserDelegate {
    private var districtInfos: [DistrictInfo] = []
    
    private var parser: XMLParser
    private var error: Error?
    
    public init(string: String) {
        parser = XMLParser(data: Data(string.utf8))
        super.init()
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        parser.abortParsing()
        self.error = parseError
    }
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        parser.abortParsing()
        self.error = validationError
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "DistrictInfo":
            districtInfos.append(DistrictInfo(districtID: attributes["DistrictID"] ?? "Error", name: attributes["Name"] ?? "Error", address: attributes["Address"] ?? "Error", url: attributes["PvueURL"] ?? "https://error.com"))
        default:
            return
        }
    }
    
    public func parse() throws -> [DistrictInfo] {
        parser.parse()
        
        if let error {
            throw error
        }
        
        return districtInfos
    }
}
