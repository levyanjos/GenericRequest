//
//  BoredAPIProvider.swift
//  GenericRequest
//
//  Created by Levy Cristian on 08/09/21.
//  Copyright © 2021 Levy Cristian. All rights reserved.
//

import Foundation

/// A provider that contains each Endpoint available at Bored API and its specific definitions
enum BoredAPIProvider {
    
    /// Gets activities 
    case activity
}

extension BoredAPIProvider: Endpoint {
    
    var base: String {
        "http://www.boredapi.com"
    }
    
    var path: String {
        switch self {
        case .activity:
            return "/api/activity"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        return nil
        
    }
    
    var parameterEncoding: ParameterEnconding {
        switch self {
        case .activity:
            return .defaultEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .activity:
            return .get
        }
    }
}

