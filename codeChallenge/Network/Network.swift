


import Foundation
import UIKit

typealias ResponseCompletion = ([AnyHashable : Any]) -> ()

@objc class Network:NSObject {
    
    @objc(sharedManager)
    static let shared = Network()

    @objc func getUrlRequest(url: String,  completionHandler: @escaping ResponseCompletion)
        {
              let urlString = URL(string: url)!
            debugPrint(urlString)
            let task = URLSession.shared.dataTask(with: urlString) {(data, response, error) in
                guard let data = data else { return }

                var dictionary: [AnyHashable: Any]? = nil
                do {
                    dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any]
                    completionHandler(dictionary ?? [:])
                } catch {
                }
            }
            task.resume()
        }

}
