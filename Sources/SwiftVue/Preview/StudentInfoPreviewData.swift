//
//  StudentInfoPreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

let sampleStudentInfo = StudentInfo(
    formattedName: "Lenna Hillard",
    permId: "27781647 ",
    gender: "Female",
    grade: "12",
    address: "2014 Forest Hills Dr&amp;lt;br&amp;gt;Fayetteville, NC 28303",
    birthDate: "07/14/2005",
    email: "27781647@SCHOOL.EDU",
    phone: "703-754-9697",
    homeLanguage: "",
    currentSchool: "Synergy High School",
    homeRoomTeacher: "Max Rega",
    homeRoomTeacherEmail: "rega@school.edu",
    homeRoomNumber: "504",
    counselorName: "",
    counselorEmail: "",
    base64Photo: "",
    emergencyContacts: [
        EmergencyContact(name: "Lonnie Pott", relationship: "Grandmother", homePhone: "423-788-9310", workPhone: "", otherPhone: "", mobilePhone: "917-253-8519"),
        EmergencyContact(name: "Armando Stuenkel", relationship: "Friend", homePhone: "510-463-1836", workPhone: "228-575-6049", otherPhone: "", mobilePhone: ""),
        EmergencyContact(name: "Liz Gunnerson", relationship: "Friend", homePhone: "", workPhone: "", otherPhone: "", mobilePhone: "903-840-2955")
    ],
    physician: Physician(name: "Dakota Galofaro", hospital: "University of Health and Wellness", phone: "703-239-0831", extn: ""),
    dentist: Dentist(name: "Zada Styer", office: "Styer Pediatric Dentistry", phone: "570-248-3380", extn: ""),
    userDefinedGroupBoxes: [
        UserDefinedGroupBox(userDefinedItems: [
            UserDefinedItem(itemLabel: "State ID#", value: "561985467"),
            UserDefinedItem(itemLabel: "Pick Up Bus Stop", value: "FOREST HILLS DR&amp;amp; MOUNTAIN VALLEY RD NE"),
            UserDefinedItem(itemLabel: "Bus Route To School", value: "0210"),
            UserDefinedItem(itemLabel: "Pick Up Transport Time", value: "6:33 AM"),
            UserDefinedItem(itemLabel: "Drop Off Transport Time", value: "2:41 PM")
        ])
    ]
)
let sampleEmergencyContact = EmergencyContact(
    name: "Lonnie Pott",
    relationship: "Grandmother",
    homePhone: "423-788-9310",
    workPhone: "",
    otherPhone: "",
    mobilePhone: "917-253-8519"
)
let samplePhysician = Physician(
    name: "Dakota Galofaro",
    hospital: "University of Health and Wellness",
    phone: "703-239-0831",
    extn: ""
)
let sampleDentist = Dentist(
    name: "Zada Styer",
    office: "Styer Pediatric Dentistry",
    phone: "570-248-3380",
    extn: ""
)
let sampleUserDefinedItem = UserDefinedItem(
    itemLabel: "State ID#",
    value: "561985467"
)
