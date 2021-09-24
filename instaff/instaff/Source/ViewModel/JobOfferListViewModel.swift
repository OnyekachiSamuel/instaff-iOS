//
//  JobOfferListViewModel.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation
import RxSwift

public protocol JobOfferListProtocol: AnyObject {
    var jobOffers: PublishSubject<[JobOffer]> { get }
    var error: PublishSubject<Error> { get }
    func getJobOffers()
}

final public class JobOfferListViewModel: JobOfferListProtocol {
    private let service: JobOfferLoader

    public let jobOffers: PublishSubject<[JobOffer]> = PublishSubject()
    public let error: PublishSubject<Error> = PublishSubject()

    public init(service: JobOfferLoader) {
        self.service = service
    }

    public func getJobOffers() {
        service.load { [weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(responseData):
                    let offers = responseData.payload.data.jobItems
                    self.jobOffers.onNext(offers)
                case let .failure(error):
                    self.error.onError(error)
                    print(error)
            }
        }
    }
}
