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
    
    public static let preview: StudentInfo = PreviewData.student1
}
