//
//  ObjectMapper.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

final class ObjectMapper {
    static func map(_ data: Data) -> Result<ResponseData,Error> {
        do {
            let jobOffers = try JSONDecoder().decode(ResponseData.self, from: data)
            return .success(jobOffers)
        } catch {
            return .failure(error)
        }
    }
}
