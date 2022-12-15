//
//  Gradebook.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct Gradebook: Hashable, Codable, Identifiable {
    public var id: UUID
    public var reportingPeriods: [ReportPeriod]
    public var reportingPeriod: ReportingPeriod
    public var courses: [Course]
    
    public init(id: UUID = UUID(), reportingPeriods: [ReportPeriod], reportingPeriod: ReportingPeriod, courses: [Course]) {
        self.id = id
        self.reportingPeriods = reportingPeriods
        self.reportingPeriod = reportingPeriod
        self.courses = courses
    }
}

public struct ReportPeriod: Hashable, Codable, Identifiable {
    public var id: UUID
    public var index: String
    public var name: String
    public var startDate: String
    public var endDate: String
    
    public init(id: UUID = UUID(), index: String, name: String, startDate: String, endDate: String) {
        self.id = id
        self.index = index
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
}

public struct ReportingPeriod: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var startDate: String
    public var endDate: String
    
    public init(id: UUID = UUID(), name: String, startDate: String, endDate: String) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
    }
}

public struct Course: Hashable, Codable, Identifiable {
    public var id: UUID
    public var period: String
    public var title: String
    public var room: String
    public var staff: String
    public var staffEmail: String
    public var marks: [Mark]
    
    public init(id: UUID = UUID(), period: String, title: String, room: String, staff: String, staffEmail: String, marks: [Mark]) {
        self.id = id
        self.period = period
        self.title = title
        self.room = room
        self.staff = staff
        self.staffEmail = staffEmail
        self.marks = marks
    }
}

public struct Mark: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var scoreString: String
    public var scoreRaw: String
    public var gradeCalculationSumary: [GradeCalculationPart]
    public var assignments: [Assignment]
    
    public init(id: UUID = UUID(), name: String, scoreString: String, scoreRaw: String, gradeCalculationSumary: [GradeCalculationPart], assignments: [Assignment]) {
        self.id = id
        self.name = name
        self.scoreString = scoreString
        self.scoreRaw = scoreRaw
        self.gradeCalculationSumary = gradeCalculationSumary
        self.assignments = assignments
    }
}

public struct GradeCalculationPart: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var weight: String
    public var points: String
    public var pointsPossible: String
    public var calculatedMark: String
    
    public var weightedPct: String
    
    public init(id: UUID = UUID(), name: String, weight: String, points: String, pointsPossible: String, calculatedMark: String, weightedPct: String) {
        self.id = id
        self.name = name
        self.weight = weight
        self.points = points
        self.pointsPossible = pointsPossible
        self.calculatedMark = calculatedMark
        self.weightedPct = weightedPct
    }
}

public struct Assignment: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var type: String
    public var date: String
    public var due: String
    public var score: String
    public var scoreType: String
    public var points: String
    public var notes: String
    public var description: String
    public var resources: [Resource]
    
    public init(id: UUID = UUID(), name: String, type: String, date: String, due: String, score: String, scoreType: String, points: String, notes: String, description: String, resources: [Resource]) {
        self.id = id
        self.name = name
        self.type = type
        self.date = date
        self.due = due
        self.score = score
        self.scoreType = scoreType
        self.points = points
        self.notes = notes
        self.description = description
        self.resources = resources
    }
}

public struct Resource: Hashable, Codable, Identifiable {
    public var id: UUID
    public var description: String
    public var name: String
    public var type: String
    public var url: String
    
    public init(id: UUID = UUID(), description: String, name: String, type: String, url: String) {
        self.id = id
        self.description = description
        self.name = name
        self.type = type
        self.url = url
    }
}

public class GradebookParser: NSObject, XMLParserDelegate {
    public var gradebook: Gradebook?
    private var reportingPeriods: [ReportPeriod] = []
    private var reportingPeriod: ReportingPeriod?
    private var courses: [Course] = []
    private var course: Course?
    private var marks: [Mark] = []
    private var mark: Mark?
    private var gradeSummary: [GradeCalculationPart] = []
    private var assignments: [Assignment] = []
    private var gradeParts: [GradeCalculationPart] = []
    private var assignment: Assignment?
    private var resources: [Resource] = []
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
        case "ReportPeriod":
            reportingPeriods.append(ReportPeriod(index: attributes["Index"] ?? "", name: attributes["GradePeriod"] ?? "Error", startDate: attributes["StartDate"] ?? "Error", endDate: attributes["EndDate"] ?? "Error"))
        case "ReportingPeriod":
            reportingPeriod = ReportingPeriod(name: attributes["GradePeriod"] ?? "Error", startDate: attributes["StartDate"] ?? "Error", endDate: attributes["EndDate"] ?? "Error")
        case "Course":
            course = Course(period: attributes["Period"] ?? "0", title: attributes["Title"] ?? "Error", room: attributes["Room"] ?? "Error", staff: attributes["Staff"] ?? "Error", staffEmail: attributes["StaffEMail"] ?? "Error", marks: [])
        case "Mark":
            mark = Mark(name: attributes["MarkName"] ?? "Error", scoreString: attributes["CalculatedScoreString"] ?? "Error", scoreRaw: attributes["CalculatedScoreRaw"] ?? "0000", gradeCalculationSumary: [], assignments: [])
        case "AssignmentGradeCalc":
            gradeSummary.append(GradeCalculationPart(name: attributes["Type"] ?? "Error", weight: attributes["Weight"] ?? "Error", points: attributes["Points"] ?? "Error", pointsPossible: attributes["PointsPossible"] ?? "Error", calculatedMark: attributes["CalculatedMark"] ?? "Error", weightedPct: attributes["WeightedPct"] ?? "Error"))
        case "Assignment":
            assignment = Assignment(name: attributes["Measure"] ?? "Error", type: attributes["Type"] ?? "Error", date: attributes["Date"] ?? "Error", due: attributes["DueDate"] ?? "Error", score: attributes["Score"] ?? "Error", scoreType: attributes["ScoreType"] ?? "Error", points: attributes["Points"] ?? "Error", notes: attributes["Notes"] ?? "Error", description: attributes["MeasureDescription"] ?? "Error", resources: [])
        case "Resource":
            resources.append(Resource(description: attributes["ResourceDescription"] ?? "Error", name: attributes["ResourceName"] ?? "Error", type: attributes["Type"] ?? "Error", url: attributes["URL"] ?? "Error"))
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case "Assignment":
            assignment?.resources = resources
            resources = []
            if let assignment {
                assignments.append(assignment)
            }
        case "Mark":
            mark?.gradeCalculationSumary = gradeSummary
            gradeSummary = []
            mark?.assignments = assignments
            assignments = []
            if let mark {
                marks.append(mark)
            }
        case "Course":
            course?.marks = marks
            marks = []
            if let course {
                courses.append(course)
            }
        case "Gradebook":
            if let reportingPeriod {
                gradebook = Gradebook(reportingPeriods: reportingPeriods, reportingPeriod: reportingPeriod, courses: courses)
            }
            reportingPeriods = []
            courses = []
        default:
            return
        }
    }
    
    public func parse() -> Result<Gradebook, Error> {
        parser.parse()
        if let gradebook {
            return .success(gradebook)
        } else {
            return .failure(SwiftVueError.xmlParsingError)
        }
    }
}
