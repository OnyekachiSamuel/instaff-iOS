//
//  JobOfferCellViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public final class JobOfferCellViewModel {
    private let jobOffer: JobOffer

    public init(jobOffer: JobOffer) {
        self.jobOffer = jobOffer
    }

    private var fromData: String {
        return format(date: jobOffer.jobOfferDetail.fromDate)
    }

    private var tillDate: String {
        return format(date: jobOffer.jobOfferDetail.tillDate)
    }

    public var date: String {
        return "\(fromData) - \(tillDate)"
    }

    public var hours: String {
        return jobOffer.jobOfferDetail.jobOfferHours
    }
}
