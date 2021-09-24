//
//  URLSessionHTTPClient.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import Foundation

class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        let request = RequestFactory.request(method: .GET, url: url, token: "1ecdnv71jqqJliacCdH1Hk0W9gr8e_")
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }

            if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            }
        }
        task.resume()
    }
}
