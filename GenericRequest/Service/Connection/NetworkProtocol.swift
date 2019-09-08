import Foundation

// MARK: Protocol

/** Protocol responsible to standardization of requests. */
protocol NetworkProtocol {
    associatedtype EndPoint: EndPointType
    func perform<T: Decodable>(_ route: EndPoint, completion: @escaping (T?, Errors?) -> (Void))
    func cancel()
    
}
