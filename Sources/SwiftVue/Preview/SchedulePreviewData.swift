//
//  SchedulePreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

let sampleSchedule = Schedule(
    termIndex: "0",
    termIndexName: "Sem 1",
    todaySchedule: TodayScheduleInfoData(
        date: "10/19/2022",
        schoolInfos: [
            SchoolInfo(
                name: "Elective Building",
                bellScheduleName: "Wed",
                classes: [
                    ClassInfo(
                        period: "02",
                        className: "AP Chemistry",
                        startTime: "12:20 PM",
                        endTime: "1:50 PM",
                        teacher: "Cricke, Watson",
                        roomName: "216",
                        teacherEmail: "w.cricke@school.edu",
                        endDate: "10/19/2022 1:50:00 PM",
                        startDate: "10/19/2022 PM"
                    )
                ]
            ),
            SchoolInfo(
                name: "Synergy High School",
                bellScheduleName: "W/F 1357",
                classes: [
                    ClassInfo(
                        period: "01",
                        className: "Off Campus",
                        startTime: "7:25 AM",
                        endTime: "8:17 AM",
                        teacher: "Domagall, Mitchel",
                        roomName: "NA",
                        teacherEmail: "domagall_m@school.edu",
                        endDate: "10/19/2022 8:17:00 AM",
                        startDate: "10/19/2022 7:25:00 AM"
                    ),
                    ClassInfo(
                        period: "03",
                        className: "AP English Literature",
                        startTime: "8:24 AM",
                        endTime: "10:10 AM",
                        teacher: "Woolf, Virginia",
                        roomName: "154",
                        teacherEmail: "woolf.v@school.edu",
                        endDate: "10/19/2022 10:10:00 AM",
                        startDate: "10/19/2022 8:24:00 AM"
                    ),
                    ClassInfo(
                        period: "05",
                        className: "AP Macroeconomics",
                        startTime: "10:17 AM",
                        endTime: "12:00 PM",
                        teacher: "Smith, Adam",
                        roomName: "486",
                        teacherEmail: "smith@school.edu",
                        endDate: "10/19/2022 12:00:00 PM",
                        startDate: "10/19/2022 10:17:00 AM"
                    ),
                    ClassInfo(
                        period: "07",
                        className: "Elective Period 7",
                        startTime: "12:42 PM",
                        endTime: "2:25 PM",
                        teacher: "",
                        roomName: "ElectiveBuilding",
                        teacherEmail: "",
                        endDate: "10/19/2022 2:25:00 PM",
                        startDate: "10/19/2022 12:42:00 PM"
                    )
                ]
            )
        ]
    ),
    classLists: [
        ClassListing(
            period: "1",
            courseTitle: "Off Campus",
            roomName: "NA",
            teacher: "Mitchel Domagall",
            teacherEmail: "domagall_m@school.edu"
        ),
        ClassListing(
            period: "2",
            courseTitle: "AP Calculus BC",
            roomName: "492",
            teacher: "John Leibniz",
            teacherEmail: "leibniz@school.edu"
        ),
        ClassListing(
            period: "3",
            courseTitle: "AP English Literature",
            roomName: "154",
            teacher: "Virginia Woolf",
            teacherEmail: "woolf.v@school.edu"
        ),
        ClassListing(
            period: "4",
            courseTitle: "Off Campus",
            roomName: "NA",
            teacher: "Mitchel Domagall",
            teacherEmail: "domagall_m@school.edu"
        ),
        ClassListing(
            period: "5",
            courseTitle: "AP Macroeconomics",
            roomName: "486",
            teacher: "Adam Smith",
            teacherEmail: "smith@school.edu"
        ),
        ClassListing(
            period: "6",
            courseTitle: "Elective Period 6",
            roomName: "ElectiveBuilding",
            teacher: "",
            teacherEmail: ""
        ),
        ClassListing(
            period: "7",
            courseTitle: "Elective Period 7",
            roomName: "ElectiveBuilding",
            teacher: "",
            teacherEmail: ""
        ),
        ClassListing(
            period: "10",
            courseTitle: "Advisory",
            roomName: "284",
            teacher: "Lucretia Cairns",
            teacherEmail: "cairns@school.edu"
        )
    ],
    termLists: [
        TermListing(
            termIndex: "0",
            termCode: "1",
            termName: "Sem 1",
            beginDate: "8/10/2022",
            endDate: "12/20/2022",
            termDefCodes: [
                TermDefCode(termDefName: "S1"),
                TermDefCode(termDefName: "YR")
            ]
        ),
        TermListing(
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
    ],
    concurrentClassSchedules: [
        ConcurrentClassSchedule(
            schoolName: "Elective Center",
            termIndex: "0",
            termIndexName: "Sem 1",
            classLists: [
                ClassListing(
                    period: "2",
                    courseTitle: "AP Chemistry",
                    roomName: "216",
                    teacher: "Watson Cricke",
                    teacherEmail: "w.cricke@school.edu"
                )
            ],
            termLists: [
                TermListing(
                    termIndex: "0",
                    termCode: "1",
                    termName: "Sem 1",
                    beginDate: "8/10/2022",
                    endDate: "12/20/2022",
                    termDefCodes: [
                        TermDefCode(termDefName: "S1"),
                        TermDefCode(termDefName: "YR")
                    ]
                ),
                TermListing(
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
            ]
        )
    ]
)
let sampleTodayScheduleInfoData = TodayScheduleInfoData(
    date: "10/19/2022",
    schoolInfos: [
        SchoolInfo(
            name: "Elective Building",
            bellScheduleName: "Wed",
            classes: [
                ClassInfo(
                    period: "02",
                    className: "AP Chemistry",
                    startTime: "12:20 PM",
                    endTime: "1:50 PM",
                    teacher: "Cricke, Watson",
                    roomName: "216",
                    teacherEmail: "w.cricke@school.edu",
                    endDate: "10/19/2022 1:50:00 PM",
                    startDate: "10/19/2022 PM"
                )
            ]
        ),
        SchoolInfo(
            name: "Synergy High School",
            bellScheduleName: "W/F 1357",
            classes: [
                ClassInfo(
                    period: "01",
                    className: "Off Campus",
                    startTime: "7:25 AM",
                    endTime: "8:17 AM",
                    teacher: "Domagall, Mitchel",
                    roomName: "NA",
                    teacherEmail: "domagall_m@school.edu",
                    endDate: "10/19/2022 8:17:00 AM",
                    startDate: "10/19/2022 7:25:00 AM"
                ),
                ClassInfo(
                    period: "03",
                    className: "AP English Literature",
                    startTime: "8:24 AM",
                    endTime: "10:10 AM",
                    teacher: "Woolf, Virginia",
                    roomName: "154",
                    teacherEmail: "woolf.v@school.edu",
                    endDate: "10/19/2022 10:10:00 AM",
                    startDate: "10/19/2022 8:24:00 AM"
                ),
                ClassInfo(
                    period: "05",
                    className: "AP Macroeconomics",
                    startTime: "10:17 AM",
                    endTime: "12:00 PM",
                    teacher: "Smith, Adam",
                    roomName: "486",
                    teacherEmail: "smith@school.edu",
                    endDate: "10/19/2022 12:00:00 PM",
                    startDate: "10/19/2022 10:17:00 AM"
                ),
                ClassInfo(
                    period: "07",
                    className: "Elective Period 7",
                    startTime: "12:42 PM",
                    endTime: "2:25 PM",
                    teacher: "",
                    roomName: "ElectiveBuilding",
                    teacherEmail: "",
                    endDate: "10/19/2022 2:25:00 PM",
                    startDate: "10/19/2022 12:42:00 PM"
                )
            ]
        )
    ]
)
let sampleSchoolInfo = SchoolInfo(
    name: "Synergy High School",
    bellScheduleName: "W/F 1357",
    classes: [
        ClassInfo(
            period: "01",
            className: "Off Campus",
            startTime: "7:25 AM",
            endTime: "8:17 AM",
            teacher: "Domagall, Mitchel",
            roomName: "NA",
            teacherEmail: "domagall_m@school.edu",
            endDate: "10/19/2022 8:17:00 AM",
            startDate: "10/19/2022 7:25:00 AM"
        ),
        ClassInfo(
            period: "03",
            className: "AP English Literature",
            startTime: "8:24 AM",
            endTime: "10:10 AM",
            teacher: "Woolf, Virginia",
            roomName: "154",
            teacherEmail: "woolf.v@school.edu",
            endDate: "10/19/2022 10:10:00 AM",
            startDate: "10/19/2022 8:24:00 AM"
        ),
        ClassInfo(
            period: "05",
            className: "AP Macroeconomics",
            startTime: "10:17 AM",
            endTime: "12:00 PM",
            teacher: "Smith, Adam",
            roomName: "486",
            teacherEmail: "smith@school.edu",
            endDate: "10/19/2022 12:00:00 PM",
            startDate: "10/19/2022 10:17:00 AM"
        ),
        ClassInfo(
            period: "07",
            className: "Elective Period 7",
            startTime: "12:42 PM",
            endTime: "2:25 PM",
            teacher: "",
            roomName: "ElectiveBuilding",
            teacherEmail: "",
            endDate: "10/19/2022 2:25:00 PM",
            startDate: "10/19/2022 12:42:00 PM"
        )
    ]
)
let sampleClassInfo = ClassInfo(
    period: "01",
    className: "Off Campus",
    startTime: "7:25 AM",
    endTime: "8:17 AM",
    teacher: "Domagall, Mitchel",
    roomName: "NA",
    teacherEmail: "domagall_m@school.edu",
    endDate: "10/19/2022 8:17:00 AM",
    startDate: "10/19/2022 7:25:00 AM"
)
let sampleClassListing = ClassListing(
    period: "1",
    courseTitle: "Off Campus",
    roomName: "NA",
    teacher: "Mitchel Domagall",
    teacherEmail: "domagall_m@school.edu"
)
let sampleTermListing = TermListing(
    termIndex: "0",
    termCode: "1",
    termName: "Sem 1",
    beginDate: "8/10/2022",
    endDate: "12/20/2022",
    termDefCodes: [
        TermDefCode(termDefName: "S1"),
        TermDefCode(termDefName: "YR")
    ]
)
let sampleConcurrentClassSchedule = ConcurrentClassSchedule(
    schoolName: "Elective Center",
    termIndex: "0",
    termIndexName: "Sem 1",
    classLists: [
        ClassListing(
            period: "2",
            courseTitle: "AP Chemistry",
            roomName: "216",
            teacher: "Watson Cricke",
            teacherEmail: "w.cricke@school.edu"
        )
    ],
    termLists: [
        TermListing(
            termIndex: "0",
            termCode: "1",
            termName: "Sem 1",
            beginDate: "8/10/2022",
            endDate: "12/20/2022",
            termDefCodes: [
                TermDefCode(termDefName: "S1"),
                TermDefCode(termDefName: "YR")
            ]
        ),
        TermListing(
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
    ]
)
