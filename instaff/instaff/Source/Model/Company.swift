//
//  Company.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

@objcMembers public class Company: Object, Decodable {
    dynamic let companyID: Int
    dynamic let companyName: String
    dynamic let companyURL: String

    private enum CodingKeys: String, CodingKey {
        case companyID = "Id"
        case companyName = "Name"
        case companyURL = "Website"
    }
}
