//
//  ScheduleParser.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public class ScheduleParser: NSObject, XMLParserDelegate {
    private var schedule: Schedule?
    private var scheduleAttributes: [String: String]?
    private var todaySchedule: TodayScheduleInfoData?
    private var classLists: [ClassListing] = []
    private var termLists: [TermListing] = []
    private var concurrentSchoolStudentClassSchedules: [ConcurrentClassSchedule] = []
    private var schoolInfos: [SchoolInfo] = []
    private var schoolInfo: SchoolInfo?
    private var classes: [ClassInfo] = []
    private var termListing: TermListing?
    private var termDefCodes: [TermDefCode] = []
    private var concurrentSchoolClassSchedule: ConcurrentClassSchedule?
    
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
        case "StudentClassSchedule":
            self.scheduleAttributes = attributes
        case "TodayScheduleInfoData":
            guard let todaySchedule = TodayScheduleInfoData(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.todaySchedule = todaySchedule
        case "SchoolInfo":
            guard let schoolInfo = SchoolInfo(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.schoolInfo = schoolInfo
        case "ClassInfo":
            guard let classInfo = ClassInfo(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.classes.append(classInfo)
        case "ClassListing":
            guard let classListing = ClassListing(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.classLists.append(classListing)
        case "TermListing":
            guard let termListing = TermListing(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.termListing = termListing
        case "TermDefCode":
            guard let termDefCode = TermDefCode(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.termDefCodes.append(termDefCode)
        case "ConcurrentSchoolStudentClassSchedule":
            guard let concurrentClassSchedule = ConcurrentClassSchedule(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.concurrentSchoolClassSchedule = concurrentClassSchedule
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case "SchoolInfo":
            self.schoolInfo?.classes = classes
            self.classes = []
            guard let schoolInfo else {
                self.parser.abortParsing()
                return
            }
            
            self.schoolInfos.append(schoolInfo)
        case "TodayScheduleInfoData":
            self.todaySchedule?.schoolInfos = schoolInfos
            self.schoolInfos = []
            guard let schedule = Schedule(attributes: scheduleAttributes, todaySchedule: todaySchedule) else {
                self.parser.abortParsing()
                return
            }
            
            self.schedule = schedule
        case "ClassLists":
            self.schedule?.classLists = classLists
            self.classLists = []
        case "TermListing":
            self.termListing?.termDefCodes = termDefCodes
            self.termDefCodes = []
            guard let termListing else {
                self.parser.abortParsing()
                return
            }
            
            self.termLists.append(termListing)
        case "TermLists":
            self.schedule?.termLists = termLists
            self.termLists = []
        case "ConcurrentSchoolStudentClassSchedule":
            self.concurrentSchoolClassSchedule?.classLists = classLists
            self.classLists = []
            self.concurrentSchoolClassSchedule?.termLists = termLists
            self.termLists = []
            guard let concurrentSchoolClassSchedule else {
                self.parser.abortParsing()
                return
            }
            
            self.concurrentSchoolStudentClassSchedules.append(concurrentSchoolClassSchedule)
        case "ConcurrentSchoolStudentClassSchedules":
            self.schedule?.concurrentClassSchedules = concurrentSchoolStudentClassSchedules
            self.concurrentSchoolStudentClassSchedules = []
        default:
            return
        }
    }
    
    public func parse() throws -> Schedule {
        self.parser.parse()
        
        if let error {
            throw error
        }
        
        if let schedule {
            return schedule
        } else {
            throw SwiftVueError.couldNotParseXML
        }
    }
}
