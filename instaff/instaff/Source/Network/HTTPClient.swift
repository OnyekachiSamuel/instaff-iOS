//
//  HTTPClient.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation
import RxSwift

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping(HTTPClientResult) -> Void)
}
