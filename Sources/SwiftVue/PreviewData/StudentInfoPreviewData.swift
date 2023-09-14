//
//  StudentInfoPreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

extension PreviewData {
    public static let dentist1 = Dentist(name: "Dr. Emily Smith", office: "SmileCare Dentistry", phone: "(555) 123-4567", extn: "123")
    public static let dentist2 = Dentist(name: "Dr. Michael Johnson", office: "BrightSmiles Dental Clinic", phone: "(555) 987-6543", extn: "456")
    public static let physician1 = Physician(name: "Dr. Sarah Johnson", hospital: "City General Hospital", phone: "(555) 111-2222", extn: "101")
    public static let physician2 = Physician(name: "Dr. Robert Davis", hospital: "Community Health Clinic", phone: "(555) 333-4444", extn: "202")
    
    public static let contact1 = EmergencyContact(
        name: "Lonnie Pott",
        relationship: "Grandmother",
        homePhone: "423-788-9310",
        workPhone: "",
        otherPhone: "",
        mobilePhone: "917-253-8519"
    )
    public static let contact2 = EmergencyContact(
        name: "Ella Williams",
        relationship: "Mother",
        homePhone: "555-123-4567",
        workPhone: "555-987-6543",
        otherPhone: "",
        mobilePhone: "555-789-0123"
    )
    public static let contact3 = EmergencyContact(
        name: "John Smith",
        relationship: "Father",
        homePhone: "",
        workPhone: "555-111-2222",
        otherPhone: "",
        mobilePhone: "555-333-4444"
    )
    public static let contact4 = EmergencyContact(
        name: "Sara Johnson",
        relationship: "Sister",
        homePhone: "",
        workPhone: "",
        otherPhone: "555-555-5555",
        mobilePhone: "555-666-6666"
    )
    
    public static let useDefinedItem1 = UserDefinedItem(
        itemLabel: "State ID#",
        value: "561985467"
    )
    public static let useDefinedItem2 = UserDefinedItem(
        itemLabel: "Library Card",
        value: "1234567890"
    )
    public static let useDefinedItem3 = UserDefinedItem(
        itemLabel: "State ID#",
        value: "A56789B"
    )
    public static let useDefinedItem4 = UserDefinedItem(
        itemLabel: "Library Card",
        value: "L12345"
    )
    
    public static let student1 = StudentInfo(
        formattedName: "Lenna Hillard",
        permId: "27781647",
        gender: "Female",
        grade: "12",
        address: "2014 Forest Hills Dr<br>Fayetteville, NC 28303",
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
        emergencyContacts: [contact1, contact2],
        physician: physician1,
        dentist: dentist1,
        userDefinedGroupBoxes: [
            UserDefinedGroupBox(userDefinedItems: [
                useDefinedItem1,
                useDefinedItem2
            ])
        ]
    )
    public static let student2 = StudentInfo(
        formattedName: "John Doe",
        permId: "12345678",
        gender: "Male",
        grade: "10",
        address: "123 Main Street<br>Anytown, USA 12345",
        birthDate: "01/15/2007",
        email: "johndoe@SCHOOL.EDU",
        phone: "555-123-4567",
        homeLanguage: "English",
        currentSchool: "Central High School",
        homeRoomTeacher: "Jane Smith",
        homeRoomTeacherEmail: "janesmith@school.edu",
        homeRoomNumber: "302",
        counselorName: "Sarah Johnson",
        counselorEmail: "sarahjohnson@school.edu",
        base64Photo: "",
        emergencyContacts: [contact3, contact4],
        physician: physician2,
        dentist: dentist2,
        userDefinedGroupBoxes: [
            UserDefinedGroupBox(userDefinedItems: [
                useDefinedItem3,
                useDefinedItem4
            ])
        ]
    )
}
