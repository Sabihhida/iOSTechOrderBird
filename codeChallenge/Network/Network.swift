


import Foundation
import UIKit

typealias ResponseCompletion = (Any, Error) -> ()

@objc class Network:NSObject {
    
    @objc(sharedManager)
    static let shared = Network()

    @objc func getUrlRequest(url: String, completionHandler: @escaping ResponseCompletion)
        {
              let urlString = URL(string: url)!

            let task = URLSession.shared.dataTask(with: urlString) {(data, response, error) in
                guard let data = data else { return }
                print("The response is : ",String(data: data, encoding: .utf8)!)
                //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)
            }
            task.resume()
        }

    // MARK: - GET REQUEST METHOD
    func getRequest<T: Codable>(url: String, type: T.Type, completionHandler: @escaping ResponseCompletion) {
        
        guard let url = FlickrApi.shared.finalUrl(url) else {
            debugPrint("Url not find")
            return
        }
        debugPrint(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // handle error
            DispatchQueue.main.async {
               // Network.codableData(data, response, error, type: type, completionHandler: completionHandler)
            }
        }.resume()
    }
    
     public static func getStringForKey(key:String) -> String    {
           
            return "Hello World";
        }
}
