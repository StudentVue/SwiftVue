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
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case "Attendance":
            attendance = Attendance(
                type: attributeDict["Type"] ?? "Error",
                startPeriod: attributeDict["StartPeriod"] ?? "Error",
                endPeriod: attributeDict["EndPeriod"] ?? "Error",
                periodCount: attributeDict["PeriodCount"] ?? "Error", 
                schoolName: attributeDict["SchoolName"] ?? "Error",
                absences: [],
                totalExcused: [],
                totalTardies: [],
                totalUnexcused: [], 
                totalActivities: [],
                TotalUnexcusedTardies: []
            )
        case "Absence":
            absence = Absence(
                absenceDate: attributeDict["AbsenceDate"] ?? "Error",
                reason: attributeDict["Reason"] ?? "Error",
                note: attributeDict["Note"] ?? "Error",
                dailyIconName: attributeDict["DailyIconName"] ?? "Error",
                codeAllDayReasonType: attributeDict["CodeAllDayReasonType"] ?? "Error",
                codeAllDayDescription: attributeDict["CodeAllDayDescription"] ?? "Error",
                periods: []
            )
        case "Period":
            absence?.periods.append(Period(
                number: attributeDict["Number"] ?? "Error",
                name: attributeDict["Name"] ?? "Error",
                reason: attributeDict["Reason"] ?? "Error",
                course: attributeDict["Course"] ?? "Error",
                staff: attributeDict["Staff"] ?? "Error",
                staffEmail: attributeDict["StaffEMail"] ?? "Error",
                iconName: attributeDict["IconName"] ?? "Error",
                schoolName: attributeDict["SchoolName"] ?? "Error")
            )
        case "PeriodTotal":
            periodTotals.append(PeriodTotal(
                number: attributeDict["Number"] ?? "Error",
                total: attributeDict["Total"] ?? "Error")
            )
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "Absence":
            if let absence {
                attendance?.absences.append(absence)
            }
        case "TotalExcused":
            attendance?.totalExcused = periodTotals
            periodTotals = []
        case "TotalTardies":
            attendance?.totalTardies = periodTotals
            periodTotals = []
        case "TotalUnexcused":
            attendance?.totalUnexcused = periodTotals
            periodTotals = []
        case "TotalActivities":
            attendance?.totalActivities = periodTotals
            periodTotals = []
        case "TotalUnexcusedTardies":
            attendance?.TotalUnexcusedTardies = periodTotals
            periodTotals = []
        default:
            return
        }
    }
    
    public func parse() throws -> Attendance {
        parser.parse()
        
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
