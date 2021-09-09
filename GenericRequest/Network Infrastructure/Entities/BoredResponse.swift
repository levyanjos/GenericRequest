//
//  BoredResponse.swift
//  GenericRequest
//
//  Created by Levy Cristian on 08/09/21.
//  Copyright © 2021 Levy Cristian. All rights reserved.
//

import Foundation

/// The response object recived by the bored api
struct BoredResponse: Codable, Descriptable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let key: String
    
    var description: String {
        get{
            return " Return\n\n activity: \(activity)\n accessibility: \(accessibility)\n type: \(type)\n participants: \(participants)\n key: \(key)"
        }
    }
}
