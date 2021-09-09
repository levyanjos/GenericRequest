//
//  BoredAPIClient.swift
//  GenericRequest
//
//  Created by Levy Cristian on 08/09/21.
//  Copyright © 2021 Levy Cristian. All rights reserved.
//

import Foundation

struct BoredAPIClient: APIClient {
    
    var session: URLSession
    
    init(session: URLSession? = nil) {
        if let session = session {
            self.session = session
        } else {
            let configuration: URLSessionConfiguration = .default
            configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            self.session = URLSession(configuration: configuration)
        }
    }
    
    
    // MARK: - Custom List Details
    
    func getActivities(completion: @escaping (Result<BoredResponse?, APIError>) -> Void) {
        guard let request = BoredAPIProvider.activity.request else {
            return completion(.failure(.badRequest))
        }
        perform(with: request, decode: { json -> BoredResponse? in
            guard let object = json as? BoredResponse else { return  nil }
            return object
        }, completion: completion)
    }
}
