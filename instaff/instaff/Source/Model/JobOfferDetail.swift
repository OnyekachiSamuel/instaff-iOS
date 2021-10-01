//
//  JobOfferDetail.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

@objcMembers public final class JobOfferDetail: Object {
    dynamic var id = UUID().uuidString
    dynamic var address: String = ""
    dynamic var city: String = ""
    dynamic var deploymentName: String = ""
    dynamic var detail: String = ""
    dynamic var fromDate: String = ""
    dynamic var jobID: Int = 0
    dynamic var jobOfferHours: String = ""
    dynamic var jobType: String = ""
    dynamic var hoursNumber: Double = 0.0
    dynamic var tillDate: String = ""
    dynamic var wage: Double = 0.0
    dynamic let wageRange: WageRange

    var estimatedTotalSalary: Double {
        return hoursNumber * wage
    }

    public override static func primaryKey() -> String {
        "id"
    }
}

extension JobOfferDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case address = "LocationString"
        case city = "City"
        case deploymentName = "Event"
        case detail = "Description"
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
