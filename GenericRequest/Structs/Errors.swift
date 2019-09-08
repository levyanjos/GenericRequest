import Foundation

// MARK: Enum

/** Enum responsible to handling possible request errors */
enum Errors: Error {
    case invalidURL
    case failRequest
    
    var localizedDescription: String {
        switch self {
            case .invalidURL: return "Invalid URL"
            case .failRequest: return "Applicantion cannot request external data"
            
        }
    }
}
