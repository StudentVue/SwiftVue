//
//  MailInboxCount.swift
//
//
//  Created by Evan Kaneshige on 12/14/23.
//

import Foundation

public struct MailInboxCount: Hashable, Codable, Identifiable {
    public var id: UUID
    public var parentRecipientAccessValue: String
    public var studentRecipientAccessValue: String
    public var staffRecipientAccessValue: String
    public var userGroupsTabAllowed: Bool
    public var massEmailTabAllowed: Bool
    public var studentGroupsTabAllowed: Bool
    public var contactListsTabAllowed: Bool
    public var staffTabAllowed: Bool
    public var parentsTabAllowed: Bool
    public var studentsTabAllowed: Bool
    public var classesTabAllowed: Bool
    public var teachersTabAllowed: Bool
    public var counselorsTabAllowed: Bool
    public var showBCC: Bool
    public var synergyMailForwardingEnabled: Bool
    public var checkUnreadMessagesTimeout: Int
    public var maxAttachmentSizeMB: Int
    public var jobTitleColumnVisible: Bool
    public var typeColumnVisible: Bool
    public var contactLogOption: String
    public var supportingClassesDropDown: Bool
    public var folderName: String
    public var count: Int
    public var personGU: String
    public var newSignature: String
    public var replySignature: String
    public var enableForwarding: Bool
    
    init(id: UUID = UUID(), parentRecipientAccessValue: String, studentRecipientAccessValue: String, staffRecipientAccessValue: String, userGroupsTabAllowed: Bool, massEmailTabAllowed: Bool, studentGroupsTabAllowed: Bool, contactListsTabAllowed: Bool, staffTabAllowed: Bool, parentsTabAllowed: Bool, studentsTabAllowed: Bool, classesTabAllowed: Bool, teachersTabAllowed: Bool, counselorsTabAllowed: Bool, showBCC: Bool, synergyMailForwardingEnabled: Bool, checkUnreadMessagesTimeout: Int, maxAttachmentSizeMB: Int, jobTitleColumnVisible: Bool, typeColumnVisible: Bool, contactLogOption: String, supportingClassesDropDown: Bool, folderName: String, count: Int, personGU: String, newSignature: String, replySignature: String, enableForwarding: Bool) {
        self.id = id
        self.parentRecipientAccessValue = parentRecipientAccessValue
        self.studentRecipientAccessValue = studentRecipientAccessValue
        self.staffRecipientAccessValue = staffRecipientAccessValue
        self.userGroupsTabAllowed = userGroupsTabAllowed
        self.massEmailTabAllowed = massEmailTabAllowed
        self.studentGroupsTabAllowed = studentGroupsTabAllowed
        self.contactListsTabAllowed = contactListsTabAllowed
        self.staffTabAllowed = staffTabAllowed
        self.parentsTabAllowed = parentsTabAllowed
        self.studentsTabAllowed = studentsTabAllowed
        self.classesTabAllowed = classesTabAllowed
        self.teachersTabAllowed = teachersTabAllowed
        self.counselorsTabAllowed = counselorsTabAllowed
        self.showBCC = showBCC
        self.synergyMailForwardingEnabled = synergyMailForwardingEnabled
        self.checkUnreadMessagesTimeout = checkUnreadMessagesTimeout
        self.maxAttachmentSizeMB = maxAttachmentSizeMB
        self.jobTitleColumnVisible = jobTitleColumnVisible
        self.typeColumnVisible = typeColumnVisible
        self.contactLogOption = contactLogOption
        self.supportingClassesDropDown = supportingClassesDropDown
        self.folderName = folderName
        self.count = count
        self.personGU = personGU
        self.newSignature = newSignature
        self.replySignature = replySignature
        self.enableForwarding = enableForwarding
    }
    
    internal init?(attributes: [String: String]) {
        guard let parentRecipientAccessValueAttribute = attributes["ParentRecipientAccessValue"],
              let studentRecipientAccessValueAttribute = attributes["StudentRecipientAccessValue"],
              let staffRecipientAccessValueAttribute = attributes["StaffRecipientAccessValue"],
              let userGroupsTabAllowedAttribute = attributes["UserGroupsTabAllowed"],
              let massEmailTabAllowedAttribute = attributes["MassEmailTabAllowed"],
              let studentGroupsTabAllowedAttribute = attributes["StudentGroupsTabAllowed"],
              let contactListsTabAllowedAttribute = attributes["ContactListsTabAllowed"],
              let staffTabAllowedAttribute = attributes["StaffTabAllowed"],
              let parentsTabAllowedAttribute = attributes["ParentsTabAllowed"],
              let studentsTabAllowedAttribute = attributes["StudentsTabAllowed"],
              let classesTabAllowedAttribute = attributes["ClassesTabAllowed"],
              let teachersTabAllowedAttribute = attributes["TeachersTabAllowed"],
              let counselorsTabAllowedAttribute = attributes["CounselorsTabAllowed"],
              let showBCCAttribute = attributes["ShowBCC"],
              let synergyMailForwardingEnabledAttribute = attributes["SynergyMailForwardingEnabled"],
              let checkUnreadMessagesTimeoutAttribute = attributes["SM_CheckUnreadMessagesTimeout"],
              let maxAttachmentSizeMBAttribute = attributes["SM_MaxAttachmentSizeMB"],
              let jobTitleColumnVisibleAttribute = attributes["SM_JobTitleColumnVisible"],
              let typeColumnVisibleAttribute = attributes["SM_TypeColumnVisible"],
              let contactLogOptionAttribute = attributes["SM_ContactLogOption"],
              let supportingClassesDropDownAttribute = attributes["SM_SupportingClassesDropDown"],
              let folderNameAttribute = attributes["FolderName"],
              let countAttribute = attributes["Count"],
              let personGUAttribute = attributes["PersonGU"],
              let newSignatureAttribute = attributes["NewSignature"],
              let replySignatureAttribute = attributes["ReplySignature"],
              let enableForwardingAttribute = attributes["EnableForwarding"] else {
            return nil
        }
        
        do {
            guard let userGroupsTabAllowed = Bool(userGroupsTabAllowedAttribute),
                  let massEmailTabAllowed = Bool(massEmailTabAllowedAttribute),
                  let studentGroupsTabAllowed = Bool(studentGroupsTabAllowedAttribute),
                  let contactListsTabAllowed = Bool(contactListsTabAllowedAttribute),
                  let staffTabAllowed = Bool(staffTabAllowedAttribute),
                  let parentsTabAllowed = Bool(parentsTabAllowedAttribute),
                  let studentsTabAllowed = Bool(studentsTabAllowedAttribute),
                  let classesTabAllowed = Bool(classesTabAllowedAttribute),
                  let teachersTabAllowed = Bool(teachersTabAllowedAttribute),
                  let counselorsTabAllowed = Bool(counselorsTabAllowedAttribute),
                  let showBCC = Bool(showBCCAttribute),
                  let synergyMailForwardingEnabled = Bool(synergyMailForwardingEnabledAttribute),
                  let jobTitleColumnVisible = Bool(jobTitleColumnVisibleAttribute),
                  let typeColumnVisible = Bool(typeColumnVisibleAttribute),
                  let supportingClassesDropDown = Bool(supportingClassesDropDownAttribute),
                  let enableForwarding = Bool(enableForwardingAttribute) else {
                return nil
            }
                  
            let checkUnreadMessagesTimeout = try Int(checkUnreadMessagesTimeoutAttribute, format: .number)
            let maxAttachmentSizeMB = try Int(maxAttachmentSizeMBAttribute, format: .number)
            let count = try Int(countAttribute, format: .number)
            
            self.init(parentRecipientAccessValue: parentRecipientAccessValueAttribute,
                      studentRecipientAccessValue: studentRecipientAccessValueAttribute,
                      staffRecipientAccessValue: staffRecipientAccessValueAttribute,
                      userGroupsTabAllowed: userGroupsTabAllowed,
                      massEmailTabAllowed: massEmailTabAllowed,
                      studentGroupsTabAllowed: studentGroupsTabAllowed,
                      contactListsTabAllowed: contactListsTabAllowed,
                      staffTabAllowed: staffTabAllowed,
                      parentsTabAllowed: parentsTabAllowed,
                      studentsTabAllowed: studentsTabAllowed,
                      classesTabAllowed: classesTabAllowed,
                      teachersTabAllowed: teachersTabAllowed,
                      counselorsTabAllowed: counselorsTabAllowed,
                      showBCC: showBCC,
                      synergyMailForwardingEnabled: synergyMailForwardingEnabled,
                      checkUnreadMessagesTimeout: checkUnreadMessagesTimeout,
                      maxAttachmentSizeMB: maxAttachmentSizeMB,
                      jobTitleColumnVisible: jobTitleColumnVisible,
                      typeColumnVisible: typeColumnVisible,
                      contactLogOption: contactLogOptionAttribute,
                      supportingClassesDropDown: supportingClassesDropDown,
                      folderName: folderNameAttribute,
                      count: count,
                      personGU: personGUAttribute,
                      newSignature: newSignatureAttribute,
                      replySignature: replySignatureAttribute,
                      enableForwarding: enableForwarding)
        } catch {
            return nil
        }
    }
}
