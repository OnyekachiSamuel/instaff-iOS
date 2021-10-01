//
//  JobDetailViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

final class JobDetailViewModel {
    let jobOfferDetail: JobOfferDetail
    private let dataStore: DataStoreProtocol

    init(jobOfferDetail: JobOfferDetail, dataStore: DataStoreProtocol = DataStore()) {
        self.jobOfferDetail = jobOfferDetail
        self.dataStore = dataStore
    }

    public var jobType: String {
        return jobOfferDetail.jobType
    }

    public var jobDescription: String {
        return jobOfferDetail.detail.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
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

    public var jobHours: String {
        return jobOfferDetail.jobOfferHours
    }

    public var jobOfferCity: String {
        return jobOfferDetail.city
    }

    public var deploymentAddress: String {
        return jobOfferDetail.deploymentName
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
}
