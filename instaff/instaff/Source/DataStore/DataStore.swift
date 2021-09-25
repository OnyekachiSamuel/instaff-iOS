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
    func getAllJobDetails(completion: @escaping ([JobOfferDetail]) -> Void)
    func remove(jobDetail: JobOfferDetail, completion: @escaping () -> Void)
}

public class DataStore: DataStoreProtocol {
    public init() {}
    
    private let realm = try! Realm()

    public func save(jobOfferDetails: List<JobOfferDetail>) {
        try! realm.write {
            realm.add(jobOfferDetails)
        }
    }

    public func getAllJobDetails(completion: @escaping ([JobOfferDetail]) -> Void) {
        let jobDetails = realm.objects(JobOfferDetail.self)
        completion(Array(jobDetails))
    }

    public func getJobOfferDetail(with jobId: Int, completion: @escaping (JobOfferDetail) -> Void) {
        let offers = realm.objects(JobOfferDetail.self)
        let result = offers.filter("jobID = \(jobId)")
        guard let jobOfferDetail = result.first else {
            return
        }
        completion(jobOfferDetail)
    }

    public func remove(jobDetail: JobOfferDetail, completion: @escaping () -> Void) {
        try! realm.write {
            realm.delete(jobDetail)
        }
    }
}


