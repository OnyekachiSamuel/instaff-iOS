//
//  JobOfferCellViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public final class JobOfferCellViewModel {
    private let jobOfferDetail: JobOfferDetail

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
}
