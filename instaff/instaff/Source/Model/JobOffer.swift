//
//  JobOffer.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import Foundation

public struct JobOffer: Decodable {
    let jobOfferDetail: JobOfferDetail
    let company: Company

    private enum CodingKeys: String, CodingKey {
        case jobOfferDetail = "offer"
        case company
    }
}
