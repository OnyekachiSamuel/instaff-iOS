//
//  JobOfferDetail.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

@objcMembers public final class JobOfferDetail: Object {
    dynamic let address: String
    dynamic let city: String
    dynamic let deploymentName: String
    dynamic let detail: String
    dynamic let fromDate: String
    dynamic let jobID: Int
    dynamic let jobOfferHours: String
    dynamic let jobType: String
    dynamic let hoursNumber: Double
    dynamic let tillDate: String
    dynamic let wage: Double
    dynamic let wageRange: WageRange

    var estimatedTotalSalary: Double {
        return hoursNumber * wage
    }
}

extension JobOfferDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case address = "LocationString"
        case city = "City"
        case deploymentName = "Event"
        case detail = "ShortDescription"
        case fromDate = "From"
        case jobID = "Id"
        case jobOfferHours = "Hours"
        case jobType = "JobTypeLabel"
        case hoursNumber = "HoursNumber"
        case tillDate = "Till"
        case wage = "Wage"
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
