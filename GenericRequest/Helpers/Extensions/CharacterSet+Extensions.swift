//
//  CharacterSet+Extensions.swift
//  TesteIOS
//
//  Created by Levy Cristian on 23/10/20.
//

import Foundation

extension CharacterSet {
    /// The collecton of character allowed to a URL
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
    
}
