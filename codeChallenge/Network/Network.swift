


import Foundation
import UIKit

typealias ResponseCompletion = ([AnyHashable : Any]) -> ()
typealias failure = (String) -> ()

@objc class Network:NSObject {
    
    @objc(sharedManager)
    static let shared = Network()
    
    @objc func getFlickrList(tag: String, pages: String,optional: [String:String]?, completionHandler: @escaping ResponseCompletion, failureHandller: @escaping failure ) {
        var params = ["tags":tag,"extras":"date_taken,description,tags,url_t,url_m","per_page":pages]
        if let optionalParams = optional, !optionalParams.isEmpty {
            for (key, value) in optionalParams {
                params[key] = value
            }
        }
        let urlString = FlickrApi.shared.finalUrl(params:params ,type: .search)
        self.getUrlRequest(url: urlString, completionHandler: completionHandler, failureHandller: failureHandller)
    }
    
    func getUrlRequest(url: String,  completionHandler: @escaping ResponseCompletion, failureHandller: @escaping failure )
    {
        let urlString = URL(string: url)!
        debugPrint(urlString)
        let task = URLSession.shared.dataTask(with: urlString) {(data, response, error) in
            if let err = error {
                failureHandller(NetworkServiceError.failedRequest.errorDescription  ?? "")
            } else {
                guard let data = data else {
                    failureHandller(NetworkServiceError.failedRequest.errorDescription ?? "")
                    return
                }
                
                var dictionary: [AnyHashable: Any]? = nil
                do {
                    dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any]
                    completionHandler(dictionary ?? [:])
                } catch let err as Error{
                    failureHandller(NetworkServiceError.invalidResponse.errorDescription ?? "")
                }
            }
        }
        task.resume()
    }
    
    
}
