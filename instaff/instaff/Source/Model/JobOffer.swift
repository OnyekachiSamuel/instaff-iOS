//
//  JobOffer.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation
import RealmSwift

public class JobOffer: Object, Decodable {
    @objc dynamic var jobOfferDetail: JobOfferDetail? = nil
    @objc dynamic var company: Company? = nil
    @objc dynamic let rating: Double

    private enum CodingKeys: String, CodingKey {
        case jobOfferDetail = "offer"
        case company
        case rating
    }
}


