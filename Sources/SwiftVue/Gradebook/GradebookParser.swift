//
//  GradebookParser.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public class GradebookParser: NSObject, XMLParserDelegate {
    private var gradebook: Gradebook?
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
    
    public func parse() throws -> Gradebook {
        parser.parse()
        
        if let error {
            throw error
        }
        
        if let gradebook {
            return gradebook
        } else {
            throw SwiftVueError.couldNotParseXML
        }
    }
}
