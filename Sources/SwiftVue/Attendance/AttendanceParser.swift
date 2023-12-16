//
//  AttendanceParser.swift
//
//
//  Created by Evan Kaneshige on 10/23/23.
//

import Foundation

public class AttendanceParser: NSObject, XMLParserDelegate {
    private var attendance: Attendance?
    private var absence: Absence?
    private var periodTotals: [PeriodTotal] = []
    
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
        case "Attendance":
            guard let attendance = Attendance(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.attendance = attendance
        case "Absence":
            guard let absence = Absence(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.absence = absence
        case "Period":
            guard let period = Period(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.absence?.periods.append(period)
        case "PeriodTotal":
            guard let periodTotal = PeriodTotal(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.periodTotals.append(periodTotal)
        case "RT_ERROR":
            self.parser.abortParsing()
            self.error = SwiftVueError.error(from: attributeDict["ERROR_MESSAGE"])
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "Absence":
            guard let absence else {
                self.parser.abortParsing()
                return
            }
            
            self.attendance?.absences.append(absence)
        case "TotalExcused":
            self.attendance?.totalExcused = periodTotals
            self.periodTotals = []
        case "TotalTardies":
            self.attendance?.totalTardies = periodTotals
            self.periodTotals = []
        case "TotalUnexcused":
            self.attendance?.totalUnexcused = periodTotals
            self.periodTotals = []
        case "TotalActivities":
            self.attendance?.totalActivities = periodTotals
            self.periodTotals = []
        case "TotalUnexcusedTardies":
            self.attendance?.TotalUnexcusedTardies = periodTotals
            self.periodTotals = []
        default:
            return
        }
    }
    
    public func parse() throws -> Attendance {
        self.parser.parse()
        
        if let error {
            throw error
        }
        
        if let attendance {
            return attendance
        } else {
            throw SwiftVueError.couldNotParseXML
        }
    }
}
