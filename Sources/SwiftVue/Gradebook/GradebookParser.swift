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
        case "ReportPeriod":
            guard let reportPeriod = ReportPeriod(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.reportingPeriods.append(reportPeriod)
        case "ReportingPeriod":
            guard let reportingPeriod = ReportingPeriod(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.reportingPeriod = reportingPeriod
        case "Course":
            guard let course = Course(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.course = course
        case "Mark":
            guard let mark = Mark(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.mark = mark
        case "AssignmentGradeCalc":
            guard let gradeCalculationPart = GradeCalculationPart(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.gradeSummary.append(gradeCalculationPart)
        case "Assignment":
            guard let assinment = Assignment(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.assignment = assinment
        case "Resource":
            guard let resource = Resource(attributes: attributes) else {
                self.parser.abortParsing()
                return
            }
            
            self.resources.append(resource)
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case "Assignment":
            self.assignment?.resources = resources
            self.resources = []
            
            guard let assignment else {
                self.parser.abortParsing()
                return
            }
            
            self.assignments.append(assignment)
        case "Mark":
            self.mark?.gradeCalculationSumary = gradeSummary
            self.gradeSummary = []
            self.mark?.assignments = assignments
            self.assignments = []
            
            guard let mark else {
                self.parser.abortParsing()
                return
            }
            
            self.marks.append(mark)
        case "Course":
            self.course?.marks = marks
            self.marks = []
            
            guard let course else {
                self.parser.abortParsing()
                return
            }
            
            self.courses.append(course)
        case "Gradebook":
            guard let reportingPeriod else {
                self.parser.abortParsing()
                return
            }
            
            self.gradebook = Gradebook(reportingPeriods: reportingPeriods, reportingPeriod: reportingPeriod, courses: courses)
            self.reportingPeriods = []
            self.courses = []
        default:
            return
        }
    }
    
    public func parse() throws -> Gradebook {
        self.parser.parse()
        
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
