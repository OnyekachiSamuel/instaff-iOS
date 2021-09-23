//
//  Company.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation

public struct Company: Decodable {
    let companyID: Int
    let companyName: String
    let companyURL: URL
    let rating: Double

    private enum CodingKeys: String, CodingKey {
        case companyID = "Id"
        case companyName = "Name"
        case companyURL = "Website"
        case rating
    }
}
