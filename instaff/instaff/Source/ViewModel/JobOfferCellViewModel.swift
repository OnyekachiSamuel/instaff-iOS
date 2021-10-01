//
//  JobOfferCellViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public final class JobOfferCellViewModel {
    public let jobOfferDetail: JobOfferDetail

    public init(jobOfferDetail: JobOfferDetail) {
        self.jobOfferDetail = jobOfferDetail
    }

    private var fromData: String {
        return format(date: jobOfferDetail.fromDate)
    }

    private var tillDate: String {
        return format(date: jobOfferDetail.tillDate)
    }

    public var date: String {
        return "\(fromData) - \(tillDate)"
    }

    public var hours: String {
        return jobOfferDetail.jobOfferHours
    }

    public var jobType: String {
        return jobOfferDetail.jobType
    }

    public var estimatedSalary: String {
        let value = jobOfferDetail.hoursNumber * jobOfferDetail.wage
        return String(value)
    }

    public var wageRange: String {
        let range = jobOfferDetail.wageRange
        switch range {
            case .integer(let int):
                return String(int)
            case .string(let string):
                return String(string)
        }
    }

    public var jobOfferCity: String {
        return jobOfferDetail.city
    }

    public var deploymentAddress: String {
        return jobOfferDetail.deploymentName
    }
}
