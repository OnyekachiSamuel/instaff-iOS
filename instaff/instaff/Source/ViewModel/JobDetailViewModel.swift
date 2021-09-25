//
//  JobDetailViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

final class JobDetailViewModel {
    private let jobOffer: JobOffer

    init(jobOffer: JobOffer) {
        self.jobOffer = jobOffer
    }

    public var jobType: String {
        return jobOffer.jobOfferDetail!.jobType
    }

    public var jobDescription: String {
        return jobOffer.jobOfferDetail!.detail
    }
}
