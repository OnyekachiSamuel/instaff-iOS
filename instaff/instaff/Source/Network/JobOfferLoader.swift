//
//  JobOfferLoader.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public protocol JobOfferLoader {
    func load(completion: @escaping (Result<ResponseData, Error>) -> Void)
}
