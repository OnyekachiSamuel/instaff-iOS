//
//  Company.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

@objcMembers public final class Company: Object {
    dynamic var companyID: Int = 0
    dynamic var companyName: String = ""
    dynamic var companyURL: String = ""
}

extension Company: Decodable {
    private enum CodingKeys: String, CodingKey {
        case companyID = "Id"
        case companyName = "Name"
        case companyURL = "Website"
    }
}
