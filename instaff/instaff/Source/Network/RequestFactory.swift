//
//  RequestFactory.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

final class RequestFactory {

    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
        case PATCH
    }

    static func request(method: Method, url: URL, token: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(token, forHTTPHeaderField: "X-Token")
        return request
    }
}
