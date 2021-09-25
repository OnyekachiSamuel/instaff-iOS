//
//  ResponseData.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

public final class ResponseData: Decodable {
    let payload: Payload
}

public final class Payload: Decodable {
    let data: Items
}
