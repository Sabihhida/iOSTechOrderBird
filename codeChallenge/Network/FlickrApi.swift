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
    var baseURL: String { get }
    var apiKey:String { get }
}

class FlickrApi:UrlRequestProtocol {
    static let shared: FlickrApi = FlickrApi(apiKey: "2ed35a9f4fda03bc96e73dbd03602780")

    var baseURL: String = "https://api.flickr.com/services/rest/?"
    var apiKey: String
    
    init(apiKey:String) {
        self.apiKey = apiKey
    }
    
    enum Methods:String {
        case search = "flickr.photos.search"
    }
    
    func finalUrl(params:[AnyHashable:Any], type:Methods) -> String {
        var urlString = baseURL+"method="+type.rawValue+"&api_key="+self.apiKey+"&format=json&nojsoncallback=1"
        for (key, value) in params {
                urlString += "&\(key)=\(value)"
        }
        return urlString
    }
    
}
