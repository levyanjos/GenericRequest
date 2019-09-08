import Foundation

// MARK: Enum

/** Emum with API's possibles resquest case */
enum BoredAPI {
    case activity
   
}

extension BoredAPI: EndPointType {
    var apiAdress: String {
        get {
            return "http://www.boredapi.com/api"
        }
        
    }
    
    var url: URL {
        return URL(string: self.path)!
        
    }
    
    var path: String {
        switch (self) {
            //Each request case should complete them self URL
            case .activity:
                 return self.apiAdress + "/activity"
        }
    }
    
}
