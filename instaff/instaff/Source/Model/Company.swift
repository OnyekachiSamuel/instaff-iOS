//
//  Company.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

@objcMembers public final class Company: Object {
    dynamic let companyID: Int
    dynamic let companyName: String
    dynamic let companyURL: String
}

extension Company: Decodable {
    private enum CodingKeys: String, CodingKey {
        case companyID = "Id"
        case companyName = "Name"
        case companyURL = "Website"
    }
}
