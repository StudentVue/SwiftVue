//
//  SchedulePreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

extension PreviewData {
    public static let classInfo1 = ClassInfo(
        period: 2,
        className: "AP Chemistry",
        startTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 20))!,
        endTime: Calendar.current.date(from: DateComponents(hour: 13, minute: 50))!,
        teacher: "Cricke, Watson",
        roomName: "216",
        teacherEmail: "w.cricke@school.edu",
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 13, minute: 50, second: 0))!,
        startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 12, minute: 20, second: 0))!
    )
    public static let classInfo2 = ClassInfo(
        period: 1,
        className: "Off Campus",
        startTime: Calendar.current.date(from: DateComponents(hour: 7, minute: 25))!,
        endTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 17))!,
        teacher: "Domagall, Mitchel",
        roomName: "NA",
        teacherEmail: "domagall_m@school.edu",
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 8, minute: 17, second: 0))!,
        startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 7, minute: 25, second: 0))!
    )
    public static let classInfo3 = ClassInfo(
        period: 3,
        className: "AP English Literature",
        startTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 24))!,
        endTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 10))!,
        teacher: "Woolf, Virginia",
        roomName: "154",
        teacherEmail: "woolf.v@school.edu",
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 10, minute: 10, second: 0))!,
        startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 8, minute: 24, second: 0))!
    )
    public static let classInfo4 = ClassInfo(
        period: 5,
        className: "AP Macroeconomics",
        startTime: Calendar.current.date(from: DateComponents(hour: 10, minute: 17))!,
        endTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 0))!,
        teacher: "Smith, Adam",
        roomName: "486",
        teacherEmail: "smith@school.edu",
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 12, minute: 0, second: 0))!,
        startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 10, minute: 17, second: 0))!
    )
    public static let classInfo5 = ClassInfo(
        period: 7,
        className: "Elective Period 7",
        startTime: Calendar.current.date(from: DateComponents(hour: 12, minute: 42))!,
        endTime: Calendar.current.date(from: DateComponents(hour: 14, minute: 25))!,
        teacher: "",
        roomName: "ElectiveBuilding",
        teacherEmail: "",
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 14, minute: 25, second: 0))!,
        startDate: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 19, hour: 12, minute: 42, second: 0))!
    )
    
    public static let classListing1 = ClassListing(
        period: 1,
        courseTitle: "Off Campus",
        roomName: "NA",
        teacher: "Mitchel Domagall",
        teacherEmail: "domagall_m@school.edu"
    )
    public static let classListing2 = ClassListing(
        period: 2,
        courseTitle: "AP Calculus BC",
        roomName: "492",
        teacher: "John Leibniz",
        teacherEmail: "leibniz@school.edu"
    )
    public static let classListing3 = ClassListing(
        period: 3,
        courseTitle: "AP English Literature",
        roomName: "154",
        teacher: "Virginia Woolf",
        teacherEmail: "woolf.v@school.edu"
    )
    public static let classListing4 = ClassListing(
        period: 4,
        courseTitle: "Off Campus",
        roomName: "NA",
        teacher: "Mitchel Domagall",
        teacherEmail: "domagall_m@school.edu"
    )
    public static let classListing5 = ClassListing(
        period: 5,
        courseTitle: "AP Macroeconomics",
        roomName: "486",
        teacher: "Adam Smith",
        teacherEmail: "smith@school.edu"
    )
    public static let classListing6 = ClassListing(
        period: 6,
        courseTitle: "Elective Period 6",
        roomName: "ElectiveBuilding",
        teacher: "",
        teacherEmail: ""
    )
    public static let classListing7 = ClassListing(
        period: 7,
        courseTitle: "Elective Period 7",
        roomName: "ElectiveBuilding",
        teacher: "",
        teacherEmail: ""
    )
    public static let classListing8 = ClassListing(
        period: 10,
        courseTitle: "Advisory",
        roomName: "284",
        teacher: "Lucretia Cairns",
        teacherEmail: "cairns@school.edu"
    )
    public static let classListing9 = ClassListing(
        period: 5,
        courseTitle: "AP Government",
        roomName: "684",
        teacher: "Smith Adams",
        teacherEmail: "adams@school.edu"
    )
    public static let classListing10 = ClassListing(
        period: 2,
        courseTitle: "AP Chemistry",
        roomName: "216",
        teacher: "Watson Cricke",
        teacherEmail: "w.cricke@school.edu"
    )
    
    public static let schoolInfo1 = SchoolInfo(
        name: "Elective Building",
        bellScheduleName: "Tue",
        classes: [classInfo1]
    )
    public static let schoolInfo2 = SchoolInfo(
        name: "Synergy High School",
        bellScheduleName: "T/R 1357",
        classes: [classInfo2, classInfo3, classInfo4, classInfo5]
    )
    
    public static let termListing1 = TermListing(
        termIndex: 0,
        termCode: "1",
        termName: "Sem 1",
        beginDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 10))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 20))!,
        termDefCodes: [
            TermDefCode(termDefName: "S1"),
            TermDefCode(termDefName: "YR")
        ]
    )
    public static let termListing2 = TermListing(
        termIndex: 1,
        termCode: "2",
        termName: "Sem 2",
        beginDate: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 5))!,
        endDate: Calendar.current.date(from: DateComponents(year: 2023, month: 5, day: 25))!,
        termDefCodes: [
            TermDefCode(termDefName: "S2"),
            TermDefCode(termDefName: "YR")
        ]
    )
    
    public static let schedule1 = Schedule(
        termIndex: 0,
        termIndexName: "Sem 1",
        todaySchedule: todaySchedule1,
        classLists: [classListing1, classListing2, classListing3, classListing4, classListing5, classListing6, classListing7, classListing8],
        termLists: [termListing1, termListing2],
        concurrentClassSchedules: [concurrentClassSchedule1]
    )
    public static let schedule2 = Schedule(
        termIndex: 1,
        termIndexName: "Sem 2",
        todaySchedule: todaySchedule1,
        classLists: [classListing1, classListing2, classListing3, classListing4, classListing9, classListing6, classListing7, classListing8],
        termLists: [termListing1, termListing2],
        concurrentClassSchedules: [concurrentClassSchedule1]
    )
    
    public static let todaySchedule1 = TodayScheduleInfoData(date: Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 12))!, schoolInfos: [schoolInfo1, schoolInfo2])
    
    public static let concurrentClassSchedule1 = ConcurrentClassSchedule(
        schoolName: "Elective Center",
        termIndex: 0,
        termIndexName: "Sem 1",
        classLists: [classListing10],
        termLists: [termListing1, termListing2]
    )
}
