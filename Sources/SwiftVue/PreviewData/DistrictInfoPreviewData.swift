//
//  DistrictInfoPreviewData.swift
//  
//
//  Created by Henry Pontzer on 8/23/23.
//

import Foundation

extension PreviewData {
    static public let districtList1 = [districtInfo1, districtInfo2, districtInfo3]
    
    static public let districtInfo1 = DistrictInfo(
        districtID: "",
        name: "Synergy School District",
        address: "East Fayetteville NC 28303",
        url: "https://mystudentlogin.school.edu"
    )
    static public let districtInfo2 = DistrictInfo(
        districtID: "",
        name: "Pinecrest County School District",
        address: "1234 Elm Street, Pinecrest, CA 98765",
        url: "https://pinecrestschools.org"
    )
    static public let districtInfo3 = DistrictInfo(
        districtID: "",
        name: "Riverside Unified School District",
        address: "555 Oak Avenue, Riverside, IL 60601",
        url: "https://riversideusd.net"
    )
}
