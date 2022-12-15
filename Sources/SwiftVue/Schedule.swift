//
//  Schedule.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Schedule: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termIndex: String
    public var termIndexName: String
    public var todaySchedule: TodayScheduleInfoData
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    public var concurrentClassSchedules: [ConcurrentClassSchedule]
    
    public init(id: UUID = UUID(), termIndex: String, termIndexName: String, todaySchedule: TodayScheduleInfoData, classLists: [ClassListing], termLists: [TermListing], concurrentClassSchedules: [ConcurrentClassSchedule]) {
        self.id = id
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.todaySchedule = todaySchedule
        self.classLists = classLists
        self.termLists = termLists
        self.concurrentClassSchedules = concurrentClassSchedules
    }
}

public struct TodayScheduleInfoData: Hashable, Codable, Identifiable {
    public var id: UUID
    public var date: String
    public var schoolInfos: [SchoolInfo]
    
    public init(id: UUID = UUID(), date: String, schoolInfos: [SchoolInfo]) {
        self.id = id
        self.date = date
        self.schoolInfos = schoolInfos
    }
}

public struct SchoolInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var bellScheduleName: String
    public var classes: [ClassInfo]
    
    public init(id: UUID = UUID(), name: String, bellScheduleName: String, classes: [ClassInfo]) {
        self.id = id
        self.name = name
        self.bellScheduleName = bellScheduleName
        self.classes = classes
    }
}

public struct ClassInfo: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var className: String
    public var startTime: String
    public var endTime: String
    public var teacher: String
    public var roomName: String
    public var teacherEmail: String
    public var endDate: String
    public var startDate: String
    
    public init(id: UUID = UUID(), period: String, className: String, startTime: String, endTime: String, teacher: String, roomName: String, teacherEmail: String, endDate: String, startDate: String) {
        self.id = id
        self.period = period
        self.className = className
        self.startTime = startTime
        self.endTime = endTime
        self.teacher = teacher
        self.roomName = roomName
        self.teacherEmail = teacherEmail
        self.endDate = endDate
        self.startDate = startDate
    }
}

public struct ClassListing: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var courseTitle: String
    public var roomName: String
    public var teacher: String
    public var teacherEmail: String
    
    public init(id: UUID = UUID(), period: String, courseTitle: String, roomName: String, teacher: String, teacherEmail: String) {
        self.id = id
        self.period = period
        self.courseTitle = courseTitle
        self.roomName = roomName
        self.teacher = teacher
        self.teacherEmail = teacherEmail
    }
}

public struct TermListing: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termIndex: String
    public var termCode: String
    public var termName: String
    public var beginDate: String
    public var endDate: String
    public var termDefCodes: [TermDefCode]
    
    public init(id: UUID = UUID(), termIndex: String, termCode: String, termName: String, beginDate: String, endDate: String, termDefCodes: [TermDefCode]) {
        self.id = id
        self.termIndex = termIndex
        self.termCode = termCode
        self.termName = termName
        self.beginDate = beginDate
        self.endDate = endDate
        self.termDefCodes = termDefCodes
    }
}

public struct TermDefCode: Hashable, Codable, Identifiable {
    public var id: UUID
    public var termDefName: String
    
    public init(id: UUID = UUID(), termDefName: String) {
        self.id = id
        self.termDefName = termDefName
    }
}

public struct ConcurrentClassSchedule: Hashable, Codable, Identifiable {
    public var id: UUID
    public var schoolName: String
    public var termIndex: String
    public var termIndexName: String
    public var classLists: [ClassListing]
    public var termLists: [TermListing]
    
    public init(id: UUID = UUID(), schoolName: String, termIndex: String, termIndexName: String, classLists: [ClassListing], termLists: [TermListing]) {
        self.id = id
        self.schoolName = schoolName
        self.termIndex = termIndex
        self.termIndexName = termIndexName
        self.classLists = classLists
        self.termLists = termLists
    }
}

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
        case "ConSchClassLists":
            concurrentSchoolClassSchedule?.classLists = classLists
            classLists = []
        case "ConSchTermLists":
            concurrentSchoolClassSchedule?.termLists = termLists
            termLists = []
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
