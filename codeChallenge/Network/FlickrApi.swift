//
//  API.swift
//  Rocket.Chat
//
//  Created by Matheus Cardoso on 9/18/17.
//  Copyright © 2017 Rocket.Chat. All rights reserved.
//

import Foundation
import Metal

protocol UrlRequestProtocol {
    
    var scheme: String { get }
    var host:String { get }
    
    func finalUrl(_ urlString:String) -> URL?
}

class FlickrApi:UrlRequestProtocol {
    static let shared: FlickrApi! = FlickrApi(host: "api.flickr.com", scheme: "https")

    var host: String
    var scheme: String
    
    func finalUrl(_ urlString:String) -> URL? {
        
        var urlBuilder = URLComponents()
        urlBuilder.scheme = scheme
        urlBuilder.host = host
        urlBuilder.path = urlString
        return urlBuilder.url
    }
    
    func urlRequest(url: String, method: String, parameters:[String:Any] ) throws -> URLRequest? {
        guard let completeUrl =  self.finalUrl(url) else {
            throw NetworkServiceError.invalideURL
        }
        var urlRequest = URLRequest(url: completeUrl)
        urlRequest.httpMethod = method
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
     
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        return urlRequest
    }
    init(host: String, scheme:String) {
        self.host = host
        self.scheme = scheme
    }
    
    
    
}
