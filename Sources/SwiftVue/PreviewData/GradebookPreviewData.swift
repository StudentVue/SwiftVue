//
//  GradebookPreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

extension PreviewData {
    public static let reportPeriod1 = ReportPeriod(index: 0, name: "1st Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 21))!, endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 11))!)
    public static let reportPeriod2 = ReportPeriod(index: 1, name: "2nd Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 16))!, endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 15))!)
    public static let reportPeriod3 = ReportPeriod(index: 2, name: "3rd Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 16))!, endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 8))!)
    public static let reportPeriod4 = ReportPeriod(index: 3, name: "4th Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 18))!, endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 10))!)
    
    public static let reportingPeriod1 = ReportingPeriod(name: "1st Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 21))!, endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 11))!)
    public static let reportingPeriod2 = ReportingPeriod(name: "2nd Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 16))!, endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 15))!)
    public static let reportingPeriod3 = ReportingPeriod(name: "3rd Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 16))!, endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 8))!)
    public static let reportingPeriod4 = ReportingPeriod(name: "4th Quarter", startDate: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 18))!, endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 10))!)
    
    public static let course1GradeCalculationPart1 = GradeCalculationPart(
        name: "Homework",
        weight: 0.2,
        points: 20,
        pointsPossible: 20,
        calculatedMark: "A+",
        weightedPct: 0.2
    )
    public static let course1GradeCalculationPart2 = GradeCalculationPart(
        name: "TOTAL",
        weight: 1,
        points: 100,
        pointsPossible: 100,
        calculatedMark: "A+",
        weightedPct: 1
    )
    public static let course1GradeCalculationPart3 = GradeCalculationPart(
        name: "Test",
        weight: 0.5,
        points: 50,
        pointsPossible: 50,
        calculatedMark: "A+",
        weightedPct: 0.5
    )
    public static let course1GradeCalculationPart4 = GradeCalculationPart(
        name: "Quiz",
        weight: 0.3,
        points: 30,
        pointsPossible: 30,
        calculatedMark: "A+",
        weightedPct: 0.3
    )
    
    public static let course2GradeCalculationPart1 = GradeCalculationPart(
        name: "Assignments/Assessments",
        weight: 0.6,
        points: 51,
        pointsPossible: 60,
        calculatedMark: "B",
        weightedPct: 0.51
    )
    public static let course2GradeCalculationPart2 = GradeCalculationPart(
        name: "Participation and Engagement",
        weight: 0.15,
        points: 12.75,
        pointsPossible: 15,
        calculatedMark: "B",
        weightedPct: 0.1275
    )
    public static let course2GradeCalculationPart3 = GradeCalculationPart(
        name: "TOTAL",
        weight: 1,
        points: 85,
        pointsPossible: 100,
        calculatedMark: "B",
        weightedPct: 0.85
    )
    public static let course2GradeCalculationPart4 = GradeCalculationPart(
        name: "AP Practice",
        weight: 0.1,
        points: 8.5,
        pointsPossible: 10,
        calculatedMark: "B",
        weightedPct: 0.085
    )
    public static let course2GradeCalculationPart5 = GradeCalculationPart(
        name: "Final Exam",
        weight: 0.15,
        points: 12.75,
        pointsPossible: 15,
        calculatedMark: "B",
        weightedPct: 0.1275
    )
    
    public static let course3GradeCalculationPart1 = GradeCalculationPart(
        name: "TOTAL",
        weight: 1,
        points: 75,
        pointsPossible: 100,
        calculatedMark: "C",
        weightedPct: 0.75
    )
    public static let course3GradeCalculationPart2 = GradeCalculationPart(
        name: "Final Exam",
        weight: 0.2,
        points: 15,
        pointsPossible: 20,
        calculatedMark: "C",
        weightedPct: 0.15
    )
    public static let course3gradeCalculationPart3 = GradeCalculationPart(
        name: "Homework",
        weight: 0.8,
        points: 60,
        pointsPossible: 80,
        calculatedMark: "C",
        weightedPct: 0.6
    )
    
    public static let course4GradeCalculationPart1 = GradeCalculationPart(
        name: "TOTAL",
        weight: 1,
        points: 55,
        pointsPossible: 100,
        calculatedMark: "F",
        weightedPct: 0.55
    )
    public static let course4GradeCalculationPart2 = GradeCalculationPart(
        name: "Final Exam",
        weight: 0.2,
        points: 11,
        pointsPossible: 20,
        calculatedMark: "F",
        weightedPct: 0.11
    )
    public static let course4GradeCalculationPart3 = GradeCalculationPart(
        name: "Homework",
        weight: 0.8,
        points: 44,
        pointsPossible: 80,
        calculatedMark: "F",
        weightedPct: 0.44
    )
    
    public static let course1Sem1 = Course(
        period: 1,
        title: "AP Calculus BC",
        room: "492",
        staff: "John Leibniz",
        staffEmail: "leibniz@school.edu",
        marks: [course1Sem1Mark1]
    )
    public static let course2Sem1 = Course(
        period: 2,
        title: "AP English Literature",
        room: "154",
        staff: "Virginia Woolf",
        staffEmail: "woolf.v@school.edu",
        marks: [course2Sem1Mark1]
    )
    public static let course3Sem1 = Course(
        period: 3,
        title: "AP Macroeconomics",
        room: "486",
        staff: "Adam Smith",
        staffEmail: "smith@school.edu",
        marks: [course3Sem1Mark1]
    )
    public static let course4Sem1 = Course(
        period: 4,
        title: "AP Chemistry",
        room: "216",
        staff: "Watson Cricke",
        staffEmail: "w.cricke@school.edu",
        marks: [course4Sem1Mark1]
    )
    
    public static let course1Sem2 = Course(
        period: 1,
        title: "AP Calculus BC",
        room: "492",
        staff: "John Leibniz",
        staffEmail: "leibniz@school.edu",
        marks: [course1Sem2Mark1, course1Sem2Mark2, course1Sem2Mark3]
    )
    public static let course2Sem2 = Course(
        period: 2,
        title: "AP English Literature",
        room: "154",
        staff: "Virginia Woolf",
        staffEmail: "woolf.v@school.edu",
        marks: [course2Sem2Mark1, course2Sem2Mark2, course2Sem2Mark3]
    )
    public static let course3Sem2 = Course(
        period: 3,
        title: "AP Macroeconomics",
        room: "486",
        staff: "Adam Smith",
        staffEmail: "smith@school.edu",
        marks: [course3Sem2Mark1, course3Sem2Mark2, course3Sem2Mark3]
    )
    public static let course4Sem2 = Course(
        period: 4,
        title: "AP Chemistry",
        room: "216",
        staff: "Watson Cricke",
        staffEmail: "w.cricke@school.edu",
        marks: [course4Sem2Mark1, course4Sem2Mark2, course4Sem2Mark3]
    )
    
    public static let course1Sem1Mark1 = Mark(
        name: "Q1 or Q3",
        scoreString: "A+",
        scoreRaw: 100,
        gradeCalculationSumary: [course1GradeCalculationPart1, course1GradeCalculationPart2, course1GradeCalculationPart3, course1GradeCalculationPart4],
        assignments: [course1Sem1Assignment1, course1Sem1Assignment2, course1Sem1Assignment3, course1Sem1Assignment4]
    )
    public static let course1Sem2Mark1 = Mark(
        name: "Q2 or Q4",
        scoreString: "A+",
        scoreRaw: 100,
        gradeCalculationSumary: [course1GradeCalculationPart1, course1GradeCalculationPart2, course1GradeCalculationPart3, course1GradeCalculationPart4],
        assignments: [course1Sem2Assignment1, course1Sem2Assignment2, course1Sem2Assignment3]
    )
    public static let course1Sem2Mark2 = Mark(
        name: "S1 Exam",
        scoreString: "A+",
        scoreRaw: 100,
        gradeCalculationSumary: [course1GradeCalculationPart1, course1GradeCalculationPart2, course1GradeCalculationPart3, course1GradeCalculationPart4],
        assignments: [course1Sem2Assignment4]
    )
    public static let course1Sem2Mark3 = Mark(
        name: "S1 Grade",
        scoreString: "A+",
        scoreRaw: 100,
        gradeCalculationSumary: [course1GradeCalculationPart1, course1GradeCalculationPart2, course1GradeCalculationPart3, course1GradeCalculationPart4],
        assignments: []
    )
    
    public static let course2Sem1Mark1 = Mark(
        name: "Q1 or Q3",
        scoreString: "B",
        scoreRaw: 85,
        gradeCalculationSumary: [course2GradeCalculationPart1, course2GradeCalculationPart2, course2GradeCalculationPart3, course2GradeCalculationPart4, course2GradeCalculationPart5],
        assignments: [course2Sem1Assignment1, course2Sem1Assignment2, course2Sem1Assignment3, course2Sem1Assignment4]
    )
    public static let course2Sem2Mark1 = Mark(
        name: "Q2 or Q4",
        scoreString: "B",
        scoreRaw: 85,
        gradeCalculationSumary: [course2GradeCalculationPart1, course2GradeCalculationPart2, course2GradeCalculationPart3, course2GradeCalculationPart4, course2GradeCalculationPart5],
        assignments: [course2Sem2Assignment1, course2Sem2Assignment2, course2Sem2Assignment3]
    )
    public static let course2Sem2Mark2 = Mark(
        name: "S1 Exam",
        scoreString: "B",
        scoreRaw: 85,
        gradeCalculationSumary: [course2GradeCalculationPart1, course2GradeCalculationPart2, course2GradeCalculationPart3, course2GradeCalculationPart4, course2GradeCalculationPart5],
        assignments: [course2Sem2Assignment4]
    )
    public static let course2Sem2Mark3 = Mark(
        name: "S1 Grade",
        scoreString: "B",
        scoreRaw: 85,
        gradeCalculationSumary: [course2GradeCalculationPart1, course2GradeCalculationPart2, course2GradeCalculationPart3, course2GradeCalculationPart4, course2GradeCalculationPart5],
        assignments: []
    )
    
    public static let course3Sem1Mark1 = Mark(
        name: "Q1 or Q3",
        scoreString: "C",
        scoreRaw: 75,
        gradeCalculationSumary: [course3GradeCalculationPart1, course3GradeCalculationPart2, course3gradeCalculationPart3],
        assignments: [course3Sem1Assignment1, course3Sem1Assignment2, course3Sem1Assignment3, course3Sem1Assignment4]
    )
    public static let course3Sem2Mark1 = Mark(
        name: "Q2 or Q4",
        scoreString: "C",
        scoreRaw: 75,
        gradeCalculationSumary: [course3GradeCalculationPart1, course3GradeCalculationPart2, course3gradeCalculationPart3],
        assignments: [course3Sem2Assignment1, course3Sem2Assignment2, course3Sem2Assignment3]
    )
    public static let course3Sem2Mark2 = Mark(
        name: "S1 Exam",
        scoreString: "C",
        scoreRaw: 75,
        gradeCalculationSumary: [course3GradeCalculationPart1, course3GradeCalculationPart2, course3gradeCalculationPart3],
        assignments: [course3Sem2Assignment4]
    )
    public static let course3Sem2Mark3 = Mark(
        name: "S1 Grade",
        scoreString: "C",
        scoreRaw: 75,
        gradeCalculationSumary: [course3GradeCalculationPart1, course3GradeCalculationPart2, course3gradeCalculationPart3],
        assignments: []
    )
    
    public static let course4Sem1Mark1 = Mark(
        name: "Q1 or Q3",
        scoreString: "F",
        scoreRaw: 55,
        gradeCalculationSumary: [course4GradeCalculationPart1, course4GradeCalculationPart2, course4GradeCalculationPart3],
        assignments: [course4Sem1Assignment1, course4Sem1Assignment2, course4Sem1Assignment3, course4Sem1Assignment4]
    )
    public static let course4Sem2Mark1 = Mark(
        name: "Q2 or Q4",
        scoreString: "F",
        scoreRaw: 55,
        gradeCalculationSumary: [course4GradeCalculationPart1, course4GradeCalculationPart2, course4GradeCalculationPart3],
        assignments: [course4Sem2Assignment1, course4Sem2Assignment2, course4Sem2Assignment3]
    )
    public static let course4Sem2Mark2 = Mark(
        name: "S1 Exam",
        scoreString: "F",
        scoreRaw: 55,
        gradeCalculationSumary: [course4GradeCalculationPart1, course4GradeCalculationPart2, course4GradeCalculationPart3],
        assignments: [course4Sem2Assignment4]
    )
    public static let course4Sem2Mark3 = Mark(
        name: "S1 Grade",
        scoreString: "F",
        scoreRaw: 55,
        gradeCalculationSumary: [course4GradeCalculationPart1, course4GradeCalculationPart2, course4GradeCalculationPart3],
        assignments: []
    )
    
    public static let gradebook1 = Gradebook(
        reportingPeriods: [reportPeriod1, reportPeriod2, reportPeriod3, reportPeriod4],
        reportingPeriod: reportingPeriod1,
        courses: [course1Sem1, course2Sem1, course3Sem1, course4Sem1]
    )
    public static let gradebook2 = Gradebook(
        reportingPeriods: [reportPeriod1, reportPeriod2, reportPeriod3, reportPeriod4],
        reportingPeriod: reportingPeriod2,
        courses: [course1Sem2, course2Sem2, course3Sem2, course4Sem2]
    )
    public static let gradebook3 = Gradebook(
        reportingPeriods: [reportPeriod1, reportPeriod2, reportPeriod3, reportPeriod4],
        reportingPeriod: reportingPeriod3,
        courses: [course1Sem1, course2Sem1, course3Sem1, course4Sem1]
    )
    public static let gradebook4 = Gradebook(
        reportingPeriods: [reportPeriod1, reportPeriod2, reportPeriod3, reportPeriod4],
        reportingPeriod: reportingPeriod4,
        courses: [course1Sem2, course2Sem2, course3Sem2, course4Sem2]
    )
    
    public static let course1Sem1Assignment1 = Assignment(
        name: "Limits and Continuity Quiz",
        type: "Quiz",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 15))!,
        score: "25.00 out of 25.0000",
        scoreType: "Raw Score",
        points: "25.00 / 25.0000",
        notes: "",
        description: "Assessing your understanding of limits and continuity concepts.",
        resources: []
    )
    public static let course1Sem1Assignment2 = Assignment(
        name: "Derivatives Project",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 5))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 20))!,
        score: "50.00 out of 50.0000",
        scoreType: "Raw Score",
        points: "50.00 / 50.0000",
        notes: "Submit on time for full credit.",
        description: "Create a project showcasing various applications of derivatives.",
        resources: []
    )
    public static let course1Sem1Assignment3 = Assignment(
        name: "Integration Practice Set",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 17))!,
        score: "15.00 out of 15.0000",
        scoreType: "Raw Score",
        points: "15.00 / 15.0000",
        notes: "",
        description: "Practice integrating functions with different techniques.",
        resources: []
    )
    public static let course1Sem1Assignment4 = Assignment(
        name: "Midterm Exam",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 15))!,
        score: "100.00 out of 100.0000",
        scoreType: "Raw Score",
        points: "100.00 / 100.0000",
        notes: "Comprehensive exam covering all topics from the first semester.",
        description: "",
        resources: []
    )
    
    public static let course1Sem2Assignment1 = Assignment(
        name: "Applications of Integration Essay",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 5))!,
        score: "30.00 out of 30.0000",
        scoreType: "Raw Score",
        points: "30.00 / 30.0000",
        notes: "Submit electronically by the due date.",
        description: "Write an essay discussing real-world applications of integration.",
        resources: []
    )
    public static let course1Sem2Assignment2 = Assignment(
        name: "Related Rates Problem Set",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 17))!,
        score: "20.00 out of 20.0000",
        scoreType: "Raw Score",
        points: "20.00 / 20.0000",
        notes: "",
        description: "Solve related rates problems involving changing quantities.",
        resources: []
    )
    public static let course1Sem2Assignment3 = Assignment(
        name: "Differential Equations Quiz",
        type: "Quiz",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 15))!,
        score: "25.00 out of 25.0000",
        scoreType: "Raw Score",
        points: "25.00 / 25.0000",
        notes: "",
        description: "Assessing your knowledge of solving differential equations.",
        resources: []
    )
    public static let course1Sem2Assignment4 = Assignment(
        name: "Final Project Presentation",
        type: "Test",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 10))!,
        score: "50.00 out of 50.0000",
        scoreType: "Raw Score",
        points: "50.00 / 50.0000",
        notes: "Prepare a 15-minute presentation on a calculus-related topic.",
        description: "",
        resources: []
    )
    
    public static let course2Sem1Assignment1 = Assignment(
        name: "Literary Analysis Essay",
        type: "Assignments/Assessments",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 5))!,
        score: "34.00 out of 40.0000",
        scoreType: "Raw Score",
        points: "34.00 / 40.0000",
        notes: "Follow MLA format for citations and references.",
        description: "Analyze a selected piece of literature and provide critical insights.",
        resources: []
    )
    public static let course2Sem1Assignment2 = Assignment(
        name: "Character Study Presentation",
        type: "Assignments/Assessments",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 30))!,
        score: "25.5 out of 30.0000",
        scoreType: "Raw Score",
        points: "25.5 / 30.0000",
        notes: "Prepare a 10-minute presentation on a character from a novel.",
        description: "",
        resources: []
    )
    public static let course2Sem1Assignment3 = Assignment(
        name: "Poetry Interpretation",
        type: "Participation and Engagement",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 5))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 12))!,
        score: "12.75 out of 15.0000",
        scoreType: "Raw Score",
        points: "12.75 / 15.0000",
        notes: "",
        description: "Analyze and interpret selected poems, focusing on literary devices.",
        resources: []
    )
    public static let course2Sem1Assignment4 = Assignment(
        name: "Midterm Exam",
        type: "Assignments/Assessments",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 10))!,
        score: "85.00 out of 100.0000",
        scoreType: "Raw Score",
        points: "85.00 / 100.0000",
        notes: "Comprehensive exam covering literature from the first semester.",
        description: "",
        resources: []
    )
    
    public static let course2Sem2Assignment1 = Assignment(
        name: "Literary Criticism Essay",
        type: "Assignments/Assessments",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 5))!,
        score: "38.25 out of 45.0000",
        scoreType: "Raw Score",
        points: "38.25 / 45.0000",
        notes: "Analyze the selected literary theory and its application to a novel.",
        description: "Explore a literary theory and apply it to a chosen literary work.",
        resources: []
    )
    public static let course2Sem2Assignment2 = Assignment(
        name: "AP Practice",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 17))!,
        score: "17.00 out of 20.0000",
        scoreType: "Raw Score",
        points: "17.00 / 20.0000",
        notes: "",
        description: "Analyze and interpret a Shakespearean sonnet of your choice.",
        resources: []
    )
    public static let course2Sem2Assignment3 = Assignment(
        name: "Literary Magazine Contribution",
        type: "Assignments/Assessments",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 25))!,
        score: "29.75 out of 35.0000",
        scoreType: "Raw Score",
        points: "29.75 / 35.0000",
        notes: "Contribute a poem or short story to the school's literary magazine.",
        description: "",
        resources: []
    )
    public static let course2Sem2Assignment4 = Assignment(
        name: "Final Presentation on a Classic Novel",
        type: "Final Exam",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 10))!,
        score: "51.00 out of 60.0000",
        scoreType: "Raw Score",
        points: "51.00 / 60.0000",
        notes: "Select a classic novel and present its significance in literature.",
        description: "",
        resources: []
    )
    
    public static let course3Sem1Assignment1 = Assignment(
        name: "Economic Systems Research Paper",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 25))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 10))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "Analyze and compare different economic systems.",
        description: "Explore and present the advantages and disadvantages of various economic systems.",
        resources: []
    )
    public static let course3Sem1Assignment2 = Assignment(
        name: "Supply and Demand Simulation",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 30))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "Participate in a class-wide supply and demand simulation.",
        description: "Simulate the effects of changes in supply and demand on market prices.",
        resources: []
    )
    public static let course3Sem1Assignment3 = Assignment(
        name: "Fiscal Policy Analysis",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 5))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 12))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "",
        description: "Analyze the impacts of fiscal policy on the economy.",
        resources: []
    )
    public static let course3Sem1Assignment4 = Assignment(
        name: "Midterm Exam",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 10))!,
        score: "75.00 out of 100.0000",
        scoreType: "Raw Score",
        points: "75.00 / 100.0000",
        notes: "Comprehensive exam covering macroeconomic principles from the first semester.",
        description: "",
        resources: []
    )
    
    public static let course3Sem2Assignment1 = Assignment(
        name: "Monetary Policy Analysis",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 5))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "Analyze the effects of monetary policy on inflation and employment.",
        description: "Evaluate the role of central banks in controlling the money supply.",
        resources: []
    )
    public static let course3Sem2Assignment2 = Assignment(
        name: "International Trade Debate",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 17))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "Prepare arguments for or against free trade policies.",
        description: "Participate in a class debate on the benefits and drawbacks of international trade.",
        resources: []
    )
    public static let course3Sem2Assignment3 = Assignment(
        name: "Economic Forecasting Project",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 4, day: 25))!,
        score: "3",
        scoreType: "0-4 Scale",
        points: "3.00 / 4.0000",
        notes: "Make predictions based on economic data and research.",
        description: "Create an economic forecast for the upcoming year based on current economic trends.",
        resources: []
    )
    public static let course3Sem2Assignment4 = Assignment(
        name: "Final Presentation on Economic Trends",
        type: "Final Exam",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 10))!,
        score: "75.00 out of 100.0000",
        scoreType: "Raw Score",
        points: "75.00 / 100.0000",
        notes: "Analyze and present significant economic trends.",
        description: "Discuss the impact of economic trends on individuals and businesses.",
        resources: []
    )
    
    public static let course4Sem1Assignment1 = Assignment(
        name: "Chemical Bonding Quiz",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 20))!,
        score: "13.75 out of 20.0000",
        scoreType: "Raw Score",
        points: "13.75 / 20.0000",
        notes: "",
        description: "Assessing your understanding of chemical bonding principles.",
        resources: []
    )
    public static let course4Sem1Assignment2 = Assignment(
        name: "Stoichiometry Lab Report",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 10))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 25))!,
        score: "22.00 out of 40.0000",
        scoreType: "Raw Score",
        points: "22.00 / 40.0000",
        notes: "Follow proper lab report formatting.",
        description: "Conduct an experiment and report on stoichiometry calculations.",
        resources: []
    )
    public static let course4Sem1Assignment3 = Assignment(
        name: "Gas Laws Problem Set",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 22))!,
        score: "8.25 out of 15.0000",
        scoreType: "Raw Score",
        points: "8.25 / 15.0000",
        notes: "",
        description: "Solve problems related to gas laws and their applications.",
        resources: []
    )
    public static let course4Sem1Assignment4 = Assignment(
        name: "Midterm Exam",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 20))!,
        score: "55.00 out of 100.0000",
        scoreType: "Raw Score",
        points: "55.00 / 100.0000",
        notes: "Comprehensive exam covering chemistry topics from the first semester.",
        description: "",
        resources: []
    )
    
    public static let course4Sem2Assignment1 = Assignment(
        name: "Chemical Kinetics Lab",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 30))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 15))!,
        score: "24.75 out of 45.0000",
        scoreType: "Raw Score",
        points: "24.75 / 45.0000",
        notes: "Perform experiments and analyze reaction rates.",
        description: "Investigate the factors affecting reaction rates and report findings.",
        resources: []
    )
    public static let course4Sem2Assignment2 = Assignment(
        name: "Acid-Base Titration Quiz",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 25))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 25))!,
        score: "13.75 out of 25.0000",
        scoreType: "Raw Score",
        points: "13.75 / 25.0000",
        notes: "",
        description: "Assessing your understanding of acid-base titrations.",
        resources: []
    )
    public static let course4Sem2Assignment3 = Assignment(
        name: "Chemical Equilibrium Problem Set",
        type: "Homework",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 15))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 22))!,
        score: "11.00 out of 20.0000",
        scoreType: "Raw Score",
        points: "11.00 / 20.0000",
        notes: "",
        description: "Solve problems related to chemical equilibrium and Le Chatelier's principle.",
        resources: []
    )
    public static let course4Sem2Assignment4 = Assignment(
        name: "Final Project - Chemical Reactions",
        type: "Final Exam",
        date: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 20))!,
        due: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 10))!,
        score: "30.25 out of 50.0000",
        scoreType: "Raw Score",
        points: "30.25 / 50.0000",
        notes: "Submit a detailed report and presentation.",
        description: "Choose a specific chemical reaction and explore its mechanisms and applications.",
        resources: []
    )
}
