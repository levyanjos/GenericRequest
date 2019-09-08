import Foundation

// MARK: Struct

/** Struct responsible to contain API json data structure */
struct Bored: Codable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let key: String
    
    var description: String{
        get{
            return " Return\n\n activity: \(activity)\n accessibility: \(accessibility)\n type: \(type)\n participants: \(participants)\n key: \(key)"
        }
    }
}

