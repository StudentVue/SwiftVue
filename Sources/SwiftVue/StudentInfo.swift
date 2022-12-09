//
//  StudentInfo.swift
//  
//
//  Created by Evan Kaneshige on 12/7/22.
//

import Foundation

public class StudentInfoParser: NSObject, XMLParserDelegate {
    public var formattedName: String = "FormattedName"
    public var permId: String = "PermID"
    public var gender: String = "Gender"
    public var grade: String = "Grade"
    public var address: String = "Address"
    public var birthDate: String = "BirthDate"
    public var email: String = "EMail"
    public var phone: String = "Phone"
    public var homeLanguage: String = "HomeLanguage"
    public var currentSchool: String = "CurrentSchool"
    public var homeRoomTeacher: String = "HomeRoomTch"
    public var homeRoomTeacherEmail: String = "HomeRoomTchEMail"
    public var homeRoomNumber: String = "HomeRoom"
    public var counselorName: String = "CounselorName"
    public var counselorEmail: String = "CounselorEmail"
    public var base64Photo: String = "Photo"
    public var emergencyContacts: [EmergencyContact] = []
    public var physician: Physician?
    public var dentist: Dentist?
    public var userDefinedGroupBoxes: [UserDefinedGroupBox] = []
    public var userDefinedGroupBox: UserDefinedGroupBox?
    public var userDefinedItems: [UserDefinedItem] = []
    public var userDefinedItem: UserDefinedItem?
    
    public var characterAcc: String = ""
    
    private var parser: XMLParser
    
    public init(string: String) {
        parser = XMLParser(data: string.data(using: .utf8) ?? Data())
        super.init()
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "EmergencyContact":
            emergencyContacts.append(EmergencyContact(id: UUID(), name: attributes["Name"] ?? "Error", relationship: attributes["Relationship"] ?? "Error", homePhone: attributes["HomePhone"] ?? "Error", workPhone: attributes["WorkPhone"] ?? "Error", otherPhone: attributes["OtherPhone"] ?? "Error", mobilePhone: attributes["MobilePhone"] ?? "Error"))
        case "Physician":
            physician = Physician(id: UUID(), name: attributes["Name"] ?? "Error", hospital: attributes["Hospital"] ?? "Error", phone: attributes["Phone"] ?? "Error", extn: attributes["Extn"] ?? "Error")
        case "Dentist":
            dentist = Dentist(id: UUID(), name: attributes["Name"] ?? "Error", office: attributes["Office"] ?? "Error", phone: attributes["Phone"] ?? "Error", extn: attributes["Extn"] ?? "Error")
        case "UserDefinedItem":
            userDefinedItems.append(UserDefinedItem(id: UUID(), itemLabel: attributes["ItemLabel"] ?? "Error", value: attributes["Value"] ?? "Error"))
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case formattedName:
            formattedName = characterAcc
        case permId:
            permId = characterAcc
        case gender:
            gender = characterAcc
        case grade:
            grade = characterAcc
        case address:
            address = characterAcc.replacingOccurrences(of: "&lt;br&gt;", with: "\n")
        case birthDate:
            birthDate = characterAcc
        case email:
            email = characterAcc
        case phone:
            phone = characterAcc
        case homeLanguage:
            homeLanguage = characterAcc
        case currentSchool:
            currentSchool = characterAcc
        case homeRoomTeacher:
            homeRoomTeacher = characterAcc
        case homeRoomTeacherEmail:
            homeRoomTeacherEmail = characterAcc
        case homeRoomNumber:
            homeRoomNumber = characterAcc
        case counselorName:
            counselorName = characterAcc
        case counselorEmail:
            counselorEmail = characterAcc
        case base64Photo:
            base64Photo = characterAcc
        case "UserDefinedGroupBox":
            userDefinedGroupBoxes.append(UserDefinedGroupBox(id: UUID(), userDefinedItems: userDefinedItems))
            userDefinedItems = []
            
        default:
            return
        }
        characterAcc = ""
    }
    
    public func parser(_ parser: XMLParser, foundCharacters: String) {
        characterAcc.append(foundCharacters)
    }
    
    public func parse() -> Result<StudentInfo, Error> {
        parser.parse()
        let info = StudentInfo(id: UUID(), formattedName: formattedName.trimmingCharacters(in: .whitespacesAndNewlines), permId: permId.trimmingCharacters(in: .whitespacesAndNewlines), gender: gender.trimmingCharacters(in: .whitespacesAndNewlines), grade: grade.trimmingCharacters(in: .whitespacesAndNewlines), address: address.trimmingCharacters(in: .whitespacesAndNewlines), birthDate: birthDate.trimmingCharacters(in: .whitespacesAndNewlines), email: email.trimmingCharacters(in: .whitespacesAndNewlines), phone: phone.trimmingCharacters(in: .whitespacesAndNewlines), homeLanguage: homeLanguage.trimmingCharacters(in: .whitespacesAndNewlines), currentSchool: currentSchool.trimmingCharacters(in: .whitespacesAndNewlines), homeRoomTeacher: homeRoomTeacher.trimmingCharacters(in: .whitespacesAndNewlines), homeRoomTeacherEmail: homeRoomTeacherEmail.trimmingCharacters(in: .whitespacesAndNewlines), homeRoomNumber: homeRoomNumber.trimmingCharacters(in: .whitespacesAndNewlines), counselorName: counselorName.trimmingCharacters(in: .whitespacesAndNewlines), counselorEmail: counselorEmail.trimmingCharacters(in: .whitespacesAndNewlines), base64Photo: base64Photo.trimmingCharacters(in: .whitespacesAndNewlines), emergencyContacts: emergencyContacts, physician: physician ?? Physician(id: UUID(), name: "Error", hospital: "Error", phone: "Error", extn: "Error"), dentist: dentist ?? Dentist(id: UUID(), name: "Error", office: "Error", phone: "Error", extn: "Error"), userDefinedGroupBoxes: userDefinedGroupBoxes)
        if info.formattedName.isEmpty {
            return .failure(SwiftVueError.xmlParsingError)
        } else {
            return .success(info)
        }
        
    }
}

public struct StudentInfo: Hashable, Codable, Identifiable {
    public var id: UUID
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
}

public struct EmergencyContact: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var relationship: String
    public var homePhone: String
    public var workPhone: String
    public var otherPhone: String
    public var mobilePhone: String
    
    public init(id: UUID = UUID(), name: String, relationship: String, homePhone: String, workPhone: String, otherPhone: String, mobilePhone: String) {
        self.id = id
        self.name = name
        self.relationship = relationship
        self.homePhone = homePhone
        self.workPhone = workPhone
        self.otherPhone = otherPhone
        self.mobilePhone = mobilePhone
    }
}

public struct Physician: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var hospital: String
    public var phone: String
    public var extn: String
    
    public init(id: UUID = UUID(), name: String, hospital: String, phone: String, extn: String) {
        self.id = id
        self.name = name
        self.hospital = hospital
        self.phone = phone
        self.extn = extn
    }
}

public struct Dentist: Hashable, Codable, Identifiable {
    public var id: UUID
    public var name: String
    public var office: String
    public var phone: String
    public var extn: String
    
    public init(id: UUID = UUID(), name: String, office: String, phone: String, extn: String) {
        self.id = id
        self.name = name
        self.office = office
        self.phone = phone
        self.extn = extn
    }
}

public struct UserDefinedGroupBox: Hashable, Codable, Identifiable {
    public var id: UUID
    public var userDefinedItems: [UserDefinedItem]
    
    public init(id: UUID = UUID(), userDefinedItems: [UserDefinedItem]) {
        self.id = id
        self.userDefinedItems = userDefinedItems
    }
}

public struct UserDefinedItem: Hashable, Codable, Identifiable {
    public var id: UUID
    public var itemLabel: String
    public var value: String
    
    public init(id: UUID = UUID(), itemLabel: String, value: String) {
        self.id = id
        self.itemLabel = itemLabel
        self.value = value
    }
}
