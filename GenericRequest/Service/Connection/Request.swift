import Foundation

// MARK: Class

/** Class responsible to handling networks request*/
class Request<T: EndPointType>: NetworkProtocol {
    
    // MARK: Varibles
    private var task: URLSessionTask?
    
    // MARK: Functions
    
    /** Perform contains implemention body of request, but it must to have Api keys and required IDs*/
    func perform<U: Decodable>(_ endPoint: T, completion: @escaping (U?, Errors?) -> (Void)) {
        let session = URLSession.shared
        var request = URLRequest(url: endPoint.url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = "GET"
        
        self.task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let responseData = data, error == nil else {
                print("Request Error:", error!.localizedDescription)
                return DispatchQueue.main.async {completion(nil, Errors.failRequest)}
            }
            
            do {
                let decodeObject = try JSONDecoder().decode(U.self, from: responseData)
                
                DispatchQueue.main.async {
                    completion(decodeObject, nil)
                }
            }
            catch {
                print("Decoding error:", error)
                DispatchQueue.main.async {completion(nil, Errors.failRequest)}
            }
        })
        
        self.task?.resume()
        
    }
    /** Call this function when you wanna cancel your taks call. */
    func cancel() {
        self.task?.cancel()
    }


}
