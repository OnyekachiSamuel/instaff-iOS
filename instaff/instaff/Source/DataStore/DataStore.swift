//
//  DataStore.swift
//  Instaff
//
//  Created by Onyekachi Ezeoke on 25/09/2021.
//

import Foundation
import RealmSwift

public protocol DataStoreProtocol {
    func save(jobOfferDetails: List<JobOfferDetail>)
    func getJobOfferDetail(with jobId: Int, completion: @escaping (JobOfferDetail) -> Void)
    func removeJobOffer(with jobId: Int, completion: @escaping () -> Void)
}

public class DataStore: DataStoreProtocol {
    public init() {}
    
    private let realm = try! Realm()

    public func save(jobOfferDetails: List<JobOfferDetail>) {
        try! realm.write {
            realm.add(jobOfferDetails)
        }
    }

    public func getJobOfferDetail(with jobId: Int, completion: @escaping (JobOfferDetail) -> Void) {
        let offers = realm.objects(JobOfferDetail.self)
        let result = offers.filter("jobID = %@", "\(jobId)")
    }

    public func removeJobOffer(with jobId: Int, completion: @escaping () -> Void) {

    }

}


