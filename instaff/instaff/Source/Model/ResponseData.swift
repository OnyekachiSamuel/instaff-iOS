//
//  ResponseData.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public struct ResponseData: Decodable {
    let payload: Payload
}

public struct Payload: Decodable {
    let data: Items
}
