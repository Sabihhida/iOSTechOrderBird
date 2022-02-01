


import Foundation
import UIKit

typealias ResponseCompletion = ([AnyHashable : Any]) -> ()

@objc class Network:NSObject {
    
    @objc(sharedManager)
    static let shared = Network()
    
    @objc func getFlickrList(tag: String, pages: String,optional: [String:String]?, completionHandler: @escaping ResponseCompletion) {
        var params = ["tags":tag,"extras":"date_taken,description,tags,url_t,url_m","per_page":pages]
        if let optionalParams = optional, !optionalParams.isEmpty {
            for (key, value) in optionalParams {
                    params[key] = value
                }
        }
        let urlString = FlickrApi.shared.finalUrl(params:params ,type: .search)
        self.getUrlRequest(url: urlString, completionHandler: completionHandler)
    }

    func getUrlRequest(url: String,  completionHandler: @escaping ResponseCompletion)
        {
              let urlString = URL(string: url)!
            debugPrint(urlString)
            let task = URLSession.shared.dataTask(with: urlString) {(data, response, error) in
                guard let data = data else { return }

                var dictionary: [AnyHashable: Any]? = nil
                do {
                    dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any]
                    completionHandler(dictionary ?? [:])
                } catch let error as Error{
                    debugPrint(error)
                }
            }
            task.resume()
        }
    

}
