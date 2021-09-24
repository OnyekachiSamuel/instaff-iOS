//
//  RemoteJobOfferLoader.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

final class RemoteJobOfferLoader: JobOfferLoader {
    private let url: URL
    private let client: HTTPClient

    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load(completion: @escaping (Result<ResponseData, Error>) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success(data, _):
                completion(ObjectMapper.map(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
