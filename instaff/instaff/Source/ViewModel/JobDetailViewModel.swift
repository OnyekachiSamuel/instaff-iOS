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
        return jobOfferDetail.detail
    }
}
