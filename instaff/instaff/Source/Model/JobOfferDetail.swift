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
    let fromDate: String
    let jobID: Int
    let jobOfferHours: String
    let jobType: String
    let tillDate: String
    let wageRange: WageRange

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

enum WageRange: Decodable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(WageRange.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for WageRange"))
    }
}
