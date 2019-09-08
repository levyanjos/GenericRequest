import Foundation

// MARK: Enum

/** Protocol to API url and path management */
public protocol EndPointType {
    var url: URL { get }
    var path: String { get }
    
}
