//
//  StudentInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public struct StudentInfo: Hashable, Codable, Identifiable {
    public var id: UUID = UUID()
    public var formattedName: String
    public var permId: String
    public var gender: String
    public var grade: String
    public var address: String
    public var birthDate: String
    public var email: String
    public var phone: String
    public var homeLanguage: String
    public var currentSchool: String
    public var homeRoomTeacher: String
    public var homeRoomTeacherEmail: String
    public var homeRoomNumber: String
    public var counselorName: String
    public var counselorEmail: String
    public var base64Photo: String
    public var emergencyContacts: [EmergencyContact]
    public var physician: Physician
    public var dentist: Dentist
    public var userDefinedGroupBoxes: [UserDefinedGroupBox]
    
    public init(id: UUID = UUID(), formattedName: String, permId: String, gender: String, grade: String, address: String, birthDate: String, email: String, phone: String, homeLanguage: String, currentSchool: String, homeRoomTeacher: String, homeRoomTeacherEmail: String, homeRoomNumber: String, counselorName: String, counselorEmail: String, base64Photo: String, emergencyContacts: [EmergencyContact], physician: Physician, dentist: Dentist, userDefinedGroupBoxes: [UserDefinedGroupBox]) {
        self.id = id
        self.formattedName = formattedName
        self.permId = permId
        self.gender = gender
        self.grade = grade
        self.address = address
        self.birthDate = birthDate
        self.email = email
        self.phone = phone
        self.homeLanguage = homeLanguage
        self.currentSchool = currentSchool
        self.homeRoomTeacher = homeRoomTeacher
        self.homeRoomTeacherEmail = homeRoomTeacherEmail
        self.homeRoomNumber = homeRoomNumber
        self.counselorName = counselorName
        self.counselorEmail = counselorEmail
        self.base64Photo = base64Photo
        self.emergencyContacts = emergencyContacts
        self.physician = physician
        self.dentist = dentist
        self.userDefinedGroupBoxes = userDefinedGroupBoxes
    }
    
    public static let preview: StudentInfo = PreviewData.student1
}
