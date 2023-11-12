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
        self.parser = XMLParser(data: Data(string.utf8))
        super.init()
        self.parser.delegate = self
        self.parser.shouldProcessNamespaces = false
        self.parser.shouldReportNamespacePrefixes = false
        self.parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        self.parser.abortParsing()
        self.error = parseError
    }
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        self.parser.abortParsing()
        self.error = validationError
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "DistrictInfo":
            guard let districtInfo = DistrictInfo(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.districtInfos.append(districtInfo)
        default:
            return
        }
    }
    
    public func parse() throws -> [DistrictInfo] {
        self.parser.parse()
        
        if let error {
            throw error
        }
        
        return self.districtInfos
    }
}
