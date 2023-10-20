//
//  StudentInfoParser.swift
//  
//
//  Created by Evan Kaneshige on 8/26/23.
//

import Foundation

public class StudentInfoParser: NSObject, XMLParserDelegate {
    private var userDefinedItems: [UserDefinedItem] = []
    private var userDefinedItem: UserDefinedItem?
    private var studentInfo: StudentInfo = StudentInfo(formattedName: "", permId: "", gender: "", grade: "", address: "", birthDate: "", email: "", phone: "", homeLanguage: "", currentSchool: "", homeRoomTeacher: "", homeRoomTeacherEmail: "", homeRoomNumber: "", counselorName: "", counselorEmail: "", base64Photo: "", emergencyContacts: [], physician: Physician(name: "", hospital: "", phone: "", extn: ""), dentist: Dentist(name: "", office: "", phone: "", extn: ""), userDefinedGroupBoxes: [])
    private var characterAcc: String = ""
    
    private var parser: XMLParser
    private var error: Error?
    
    public init(string: String) {
        parser = XMLParser(data: Data(string.utf8))
        super.init()
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        parser.abortParsing()
        self.error = parseError
    }
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        parser.abortParsing()
        self.error = validationError
    }
    
    public func parser(_ parser: XMLParser, didStartElement: String, namespaceURI: String?, qualifiedName: String?, attributes: [String : String]) {
        switch didStartElement {
        case "EmergencyContact":
            studentInfo.emergencyContacts.append(EmergencyContact(id: UUID(), name: attributes["Name"] ?? "Error", relationship: attributes["Relationship"] ?? "Error", homePhone: attributes["HomePhone"] ?? "Error", workPhone: attributes["WorkPhone"] ?? "Error", otherPhone: attributes["OtherPhone"] ?? "Error", mobilePhone: attributes["MobilePhone"] ?? "Error"))
        case "Physician":
            studentInfo.physician = Physician(id: UUID(), name: attributes["Name"] ?? "Error", hospital: attributes["Hospital"] ?? "Error", phone: attributes["Phone"] ?? "Error", extn: attributes["Extn"] ?? "Error")
        case "Dentist":
            studentInfo.dentist = Dentist(id: UUID(), name: attributes["Name"] ?? "Error", office: attributes["Office"] ?? "Error", phone: attributes["Phone"] ?? "Error", extn: attributes["Extn"] ?? "Error")
        case "UserDefinedItem":
            userDefinedItems.append(UserDefinedItem(id: UUID(), itemLabel: attributes["ItemLabel"] ?? "Error", value: attributes["Value"] ?? "Error"))
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement: String, namespaceURI: String?, qualifiedName: String?) {
        switch didEndElement {
        case "FormattedName":
            studentInfo.formattedName = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "PermID":
            studentInfo.permId = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Gender":
            studentInfo.gender = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Grade":
            studentInfo.grade = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Address":
            studentInfo.address = characterAcc.replacingOccurrences(of: "&lt;br&gt;", with: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
        case "BirthDate":
            studentInfo.birthDate = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "EMail":
            studentInfo.email = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Phone":
            studentInfo.phone = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeLanguage":
            studentInfo.homeLanguage = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CurrentSchool":
            studentInfo.currentSchool = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoomTch":
            studentInfo.homeRoomTeacher = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoomTchEMail":
            studentInfo.homeRoomTeacherEmail = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoom":
            studentInfo.homeRoomNumber = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CounselorName":
            studentInfo.counselorName = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CounselorEmail":
            studentInfo.counselorEmail = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Photo":
            studentInfo.base64Photo = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "UserDefinedGroupBox":
            studentInfo.userDefinedGroupBoxes.append(UserDefinedGroupBox(id: UUID(), userDefinedItems: userDefinedItems))
            userDefinedItems = []
        default:
            return
        }
        characterAcc = ""
    }
    
    public func parser(_ parser: XMLParser, foundCharacters: String) {
        characterAcc.append(foundCharacters)
    }
    
    public func parse() throws -> StudentInfo {
        parser.parse()
        
        if let error {
            throw error
        }
        
        return studentInfo
    }
}
