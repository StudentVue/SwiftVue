//
//  ScheduleParser.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public class ScheduleParser: NSObject, XMLParserDelegate {
    public var schedule: Schedule?
    private var termIndex: String?
    private var termIndexName: String?
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
    
    public init(string: String) {
        parser = XMLParser(data: string.data(using: .utf8) ?? Data())
        super.init()
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        parser.abortParsing()
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "StudentClassSchedule":
            termIndex = attributes["TermIndex"] ?? "Error"
            termIndexName = attributes["TermIndexName"] ?? "Error"
        case "TodayScheduleInfoData":
            todaySchedule = TodayScheduleInfoData(date: attributes["Date"] ?? "Error", schoolInfos: [])
        case "SchoolInfo":
            schoolInfo = SchoolInfo(name: attributes["SchoolName"] ?? "Error", bellScheduleName: attributes["BellSchedName"] ?? "Error", classes: [])
        case "ClassInfo":
            classes.append(ClassInfo(period: attributes["Period"] ?? "Error", className: attributes["ClassName"] ?? "Error", startTime: attributes["StartTime"] ?? "Error", endTime: attributes["EndTime"] ?? "Error", teacher: attributes["TeacherName"] ?? "Error", roomName: attributes["RoomName"] ?? "Error", teacherEmail: attributes["TeacherEmail"] ?? "Error", endDate: attributes["EndDate"] ?? "Error", startDate: attributes["StartDate"] ?? "Error"))
        case "ClassListing":
            classLists.append(ClassListing(period: attributes["Period"] ?? "Error", courseTitle: attributes["CourseTitle"] ?? "Error", roomName: attributes["RoomName"] ?? "Error", teacher: attributes["Teacher"] ?? "Error", teacherEmail: attributes["TeacherEmail"] ?? "Error"))
        case "TermListing":
            termListing = TermListing(termIndex: attributes["TermIndex"] ?? "Error", termCode: attributes["TermCode"] ?? "Error", termName: attributes["TermName"] ?? "Error", beginDate: attributes["BeginDate"] ?? "Error", endDate: attributes["EndDate"] ?? "Error", termDefCodes: [])
        case "TermDefCode":
            termDefCodes.append(TermDefCode(termDefName: attributes["TermDefName"] ?? "Error"))
        case "ConcurrentSchoolStudentClassSchedule":
            concurrentSchoolClassSchedule = ConcurrentClassSchedule(schoolName: attributes["SchoolName"] ?? "Error", termIndex: attributes["ConSchTermIndex"] ?? "Error", termIndexName: attributes["ConSchTermIndexName"] ?? "Error", classLists: [], termLists: [])
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case "SchoolInfo":
            schoolInfo?.classes = classes
            classes = []
            if let schoolInfo {
                schoolInfos.append(schoolInfo)
            }
        case "TodayScheduleInfoData":
            todaySchedule?.schoolInfos = schoolInfos
            schoolInfos = []
            if let todaySchedule, let termIndex, let termIndexName {
                schedule = Schedule(termIndex: termIndex, termIndexName: termIndexName, todaySchedule: todaySchedule, classLists: [], termLists: [], concurrentClassSchedules: [])
            }
        case "ClassLists":
            schedule?.classLists = classLists
            classLists = []
        case "TermListing":
            termListing?.termDefCodes = termDefCodes
            termDefCodes = []
            if let termListing {
                termLists.append(termListing)
            }
        case "TermLists":
            schedule?.termLists = termLists
            termLists = []
        case "ConcurrentSchoolStudentClassSchedule":
            concurrentSchoolClassSchedule?.classLists = classLists
            classLists = []
            concurrentSchoolClassSchedule?.termLists = termLists
            termLists = []
            if let concurrentSchoolClassSchedule {
                concurrentSchoolStudentClassSchedules.append(concurrentSchoolClassSchedule)
            }
        case "ConcurrentSchoolStudentClassSchedules":
            schedule?.concurrentClassSchedules = concurrentSchoolStudentClassSchedules
            concurrentSchoolStudentClassSchedules = []
        default:
            return
        }
    }
    
    public func parse() -> Result<Schedule, Error> {
        parser.parse()
        if let schedule {
            return .success(schedule)
        } else {
            return .failure(SwiftVueError.xmlParsingError)
        }
    }
}
