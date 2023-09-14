//
//  SchedulePreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

extension PreviewData {
    public static let classInfo1 = ClassInfo(
        period: "02",
        className: "AP Chemistry",
        startTime: "12:20 PM",
        endTime: "1:50 PM",
        teacher: "Cricke, Watson",
        roomName: "216",
        teacherEmail: "w.cricke@school.edu",
        endDate: "10/19/2023 1:50:00 PM",
        startDate: "10/19/2023 12:20:00 PM"
    )
    public static let classInfo2 = ClassInfo(
        period: "01",
        className: "Off Campus",
        startTime: "7:25 AM",
        endTime: "8:17 AM",
        teacher: "Domagall, Mitchel",
        roomName: "NA",
        teacherEmail: "domagall_m@school.edu",
        endDate: "10/19/2023 8:17:00 AM",
        startDate: "10/19/2023 7:25:00 AM"
    )
    public static let classInfo3 = ClassInfo(
        period: "03",
        className: "AP English Literature",
        startTime: "8:24 AM",
        endTime: "10:10 AM",
        teacher: "Woolf, Virginia",
        roomName: "154",
        teacherEmail: "woolf.v@school.edu",
        endDate: "10/19/2023 10:10:00 AM",
        startDate: "10/19/2023 8:24:00 AM"
    )
    public static let classInfo4 = ClassInfo(
        period: "05",
        className: "AP Macroeconomics",
        startTime: "10:17 AM",
        endTime: "12:00 PM",
        teacher: "Smith, Adam",
        roomName: "486",
        teacherEmail: "smith@school.edu",
        endDate: "10/19/2023 12:00:00 PM",
        startDate: "10/19/2023 10:17:00 AM"
    )
    public static let classInfo5 = ClassInfo(
        period: "07",
        className: "Elective Period 7",
        startTime: "12:42 PM",
        endTime: "2:25 PM",
        teacher: "",
        roomName: "ElectiveBuilding",
        teacherEmail: "",
        endDate: "10/19/2023 2:25:00 PM",
        startDate: "10/19/2023 12:42:00 PM"
    )
    
    public static let classListing1 = ClassListing(
        period: "1",
        courseTitle: "Off Campus",
        roomName: "NA",
        teacher: "Mitchel Domagall",
        teacherEmail: "domagall_m@school.edu"
    )
    public static let classListing2 = ClassListing(
        period: "2",
        courseTitle: "AP Calculus BC",
        roomName: "492",
        teacher: "John Leibniz",
        teacherEmail: "leibniz@school.edu"
    )
    public static let classListing3 = ClassListing(
        period: "3",
        courseTitle: "AP English Literature",
        roomName: "154",
        teacher: "Virginia Woolf",
        teacherEmail: "woolf.v@school.edu"
    )
    public static let classListing4 = ClassListing(
        period: "4",
        courseTitle: "Off Campus",
        roomName: "NA",
        teacher: "Mitchel Domagall",
        teacherEmail: "domagall_m@school.edu"
    )
    public static let classListing5 = ClassListing(
        period: "5",
        courseTitle: "AP Macroeconomics",
        roomName: "486",
        teacher: "Adam Smith",
        teacherEmail: "smith@school.edu"
    )
    public static let classListing6 = ClassListing(
        period: "6",
        courseTitle: "Elective Period 6",
        roomName: "ElectiveBuilding",
        teacher: "",
        teacherEmail: ""
    )
    public static let classListing7 = ClassListing(
        period: "7",
        courseTitle: "Elective Period 7",
        roomName: "ElectiveBuilding",
        teacher: "",
        teacherEmail: ""
    )
    public static let classListing8 = ClassListing(
        period: "10",
        courseTitle: "Advisory",
        roomName: "284",
        teacher: "Lucretia Cairns",
        teacherEmail: "cairns@school.edu"
    )
    public static let classListing9 = ClassListing(
        period: "5",
        courseTitle: "AP Government",
        roomName: "684",
        teacher: "Smith Adams",
        teacherEmail: "adams@school.edu"
    )
    public static let classListing10 = ClassListing(
        period: "2",
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
        termIndex: "0",
        termCode: "1",
        termName: "Sem 1",
        beginDate: "8/10/2023",
        endDate: "12/20/2023",
        termDefCodes: [
            TermDefCode(termDefName: "S1"),
            TermDefCode(termDefName: "YR")
        ]
    )
    public static let termListing2 = TermListing(
        termIndex: "1",
        termCode: "2",
        termName: "Sem 2",
        beginDate: "01/05/2023",
        endDate: "05/25/2023",
        termDefCodes: [
            TermDefCode(termDefName: "S2"),
            TermDefCode(termDefName: "YR")
        ]
    )
    
    public static let schedule1 = Schedule(
        termIndex: "0",
        termIndexName: "Sem 1",
        todaySchedule: todaySchedule1,
        classLists: [classListing1, classListing2, classListing3, classListing4, classListing5, classListing6, classListing7, classListing8],
        termLists: [termListing1, termListing2],
        concurrentClassSchedules: [concurrentClassSchedule1]
    )
    public static let schedule2 = Schedule(
        termIndex: "1",
        termIndexName: "Sem 2",
        todaySchedule: todaySchedule1,
        classLists: [classListing1, classListing2, classListing3, classListing4, classListing9, classListing6, classListing7, classListing8],
        termLists: [termListing1, termListing2],
        concurrentClassSchedules: [concurrentClassSchedule1]
    )
    
    public static let todaySchedule1 = TodayScheduleInfoData(date: "10/12/23", schoolInfos: [schoolInfo1, schoolInfo2])
    
    public static let concurrentClassSchedule1 = ConcurrentClassSchedule(
        schoolName: "Elective Center",
        termIndex: "0",
        termIndexName: "Sem 1",
        classLists: [classListing10],
        termLists: [termListing1, termListing2]
    )
}
