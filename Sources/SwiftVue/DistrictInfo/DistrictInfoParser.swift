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
        if self.error == nil {
            self.error = parseError
        }
    }
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        self.parser.abortParsing()
        self.error = validationError
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case "DistrictInfo":
            guard let districtInfo = DistrictInfo(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.districtInfos.append(districtInfo)
        case "RT_ERROR":
            self.parser.abortParsing()
            self.error = SwiftVueError.error(from: attributeDict["ERROR_MESSAGE"])
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
