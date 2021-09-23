//
//  JobOfferDetail.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation

public struct JobOfferDetail: Decodable {
    let address: String
    let city: String
    let description: String
    let fromDate: Date
    let jobID: Int
    let jobOfferHours: String
    let jobType: String
    let tillDate: Date
    let wageRange: String

    private enum CodingKeys: String, CodingKey {
        case address = "LocationString"
        case city = "City"
        case description = "ShortDescription"
        case fromDate = "From"
        case jobID = "Id"
        case jobOfferHours = "Hours"
        case jobType = "JobTypeLabel"
        case tillDate = "Till"
        case wageRange = "WageRange"
    }
}
