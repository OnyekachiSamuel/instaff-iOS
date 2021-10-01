//
//  JobOfferListViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation
import RxSwift
import RealmSwift

public protocol JobOfferListProtocol: AnyObject {
    var jobOffers: PublishSubject<[JobOfferDetail]> { get }
    var error: PublishSubject<Error> { get }
    func getJobOffers()
    func getJobOfferDetails()
    func remove(jobDetail: JobOfferDetail, completion: @escaping () -> Void)
}

final public class JobOfferListViewModel: JobOfferListProtocol {
    private let service: JobOfferLoader
    private let dataStore: DataStoreProtocol

    public let jobOffers: PublishSubject<[JobOfferDetail]> = PublishSubject()
    public let error: PublishSubject<Error> = PublishSubject()
    public var offers: Observable<[JobOfferDetail]> {
        return jobOffers.asObservable()
    }
    public let title = "Job Offers"
    public init(service: JobOfferLoader, dataStore: DataStoreProtocol = DataStore()) {
        self.service = service
        self.dataStore = dataStore
    }

    public func getJobOffers() {
        service.load { [weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(responseData):
                    let offers = responseData.payload.data.jobItems
                    let result = offers.compactMap { $0.jobOfferDetail }
                    let jobOfferDetails = List<JobOfferDetail>()
                    jobOfferDetails.append(objectsIn: result)
                    DispatchQueue.main.async {
                        self.dataStore.save(jobOfferDetails: jobOfferDetails)
                        self.jobOffers.onNext(result)
                    }
                case let .failure(error):
                    self.error.onError(error)
            }
        }
    }

    public func getJobOfferDetails() {
        dataStore.getAllJobDetails { jobDetails in
            DispatchQueue.main.async {
                self.jobOffers.onNext(jobDetails)
            }
        }
    }

    public func remove(jobDetail: JobOfferDetail, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            self.dataStore.remove(jobDetail: jobDetail)
            completion()
        }
    }
}
