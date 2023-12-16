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
        self.parser = XMLParser(data: Data(string.utf8))
        super.init()
        self.parser.delegate = self
        self.parser.shouldProcessNamespaces = false
        self.parser.shouldReportNamespacePrefixes = false
        self.parser.shouldResolveExternalEntities = false
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        self.parser.abortParsing()
        if self.error == nil {
            self.error = parseError
        }
    }
    
    public func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        self.parser.abortParsing()
        self.error = validationError
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case "EmergencyContact":
            guard let emergencyContact = EmergencyContact(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.studentInfo.emergencyContacts.append(emergencyContact)
        case "Physician":
            guard let physician = Physician(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.studentInfo.physician = physician
        case "Dentist":
            guard let dentist = Dentist(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.studentInfo.dentist = dentist
        case "UserDefinedItem":
            guard let userDefinedItem = UserDefinedItem(attributes: attributeDict) else {
                self.parser.abortParsing()
                return
            }
            
            self.userDefinedItems.append(userDefinedItem)
        case "RT_ERROR":
            self.parser.abortParsing()
            self.error = SwiftVueError.error(from: attributeDict["ERROR_MESSAGE"])
        default:
            return
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "FormattedName":
            self.studentInfo.formattedName = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "PermID":
            self.studentInfo.permId = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Gender":
            self.studentInfo.gender = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Grade":
            self.studentInfo.grade = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Address":
            self.studentInfo.address = characterAcc.replacingOccurrences(of: "&lt;br&gt;", with: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
        case "BirthDate":
            self.studentInfo.birthDate = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "EMail":
            self.studentInfo.email = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Phone":
            self.studentInfo.phone = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeLanguage":
            self.studentInfo.homeLanguage = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CurrentSchool":
            self.studentInfo.currentSchool = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoomTch":
            self.studentInfo.homeRoomTeacher = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoomTchEMail":
            self.studentInfo.homeRoomTeacherEmail = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "HomeRoom":
            self.studentInfo.homeRoomNumber = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CounselorName":
            self.studentInfo.counselorName = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "CounselorEmail":
            self.studentInfo.counselorEmail = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "Photo":
            self.studentInfo.base64Photo = characterAcc.trimmingCharacters(in: .whitespacesAndNewlines)
        case "UserDefinedGroupBox":
            self.studentInfo.userDefinedGroupBoxes.append(UserDefinedGroupBox(id: UUID(), userDefinedItems: self.userDefinedItems))
            self.userDefinedItems = []
        default:
            return
        }
        self.characterAcc = ""
    }
    
    public func parser(_ parser: XMLParser, foundCharacters: String) {
        self.characterAcc.append(foundCharacters)
    }
    
    public func parse() throws -> StudentInfo {
        self.parser.parse()
        
        if let error {
            throw error
        }
        
        return self.studentInfo
    }
}
