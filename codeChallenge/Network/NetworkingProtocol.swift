//
//  NetworkingProtocol.swift
//  TapmadTV
//
//  Created by Bilal Naushad on 04/01/2021.
//  Copyright © 2021 Pi Pakistan. All rights reserved.
//

import Foundation

protocol NetworkingProtocol {
    static func codableData<T: Codable>(_ data :Data?,_ response: URLResponse?,_ error: Error?, type: T.Type,completionHandler: @escaping ResponseCompletion) -> Void
}

/*extension NetworkingProtocol {
  
    static func codableData<T: Codable>(_ data :Data?,_ response: URLResponse?,_ error: Error?, type: T.Type,completionHandler: @escaping ResponseCompletion) -> Void {
        
        guard error == nil else {
            print("Failed request from FlickAPi:  \(error!.localizedDescription)")
            if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                completionHandler(nil, .connectionFailed)
            } else {
                completionHandler(nil, .failedRequest)
            }
            return
        }
        var errorCode : Int = 0
        guard let data = data else {
            print("No data returned from FlickAPi")
            completionHandler(nil, .noData)
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            print("Unable to process FlickAPi response")
            completionHandler(nil, .invalidResponse)
            return
        }
        
        guard response.statusCode == 200 else {
            print("Failure response from FlickAPi: \(response.statusCode)")
            completionHandler(nil, .failedRequest)
            return
        }
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                debugPrint(json)
               // completionHandler(nil, .failedRequest)
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        do {
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(T.self, from: data)
            completionHandler(responseData, nil)
            
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            completionHandler(nil, .failedRequest)
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription) Key \(context.codingPath)")
            completionHandler(nil, .failedRequest)
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for \(type) in JSON: \(context.debugDescription) \(context.codingPath)")
            completionHandler(nil, .failedRequest)
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            completionHandler(nil, .failedRequest)
            
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            completionHandler(nil, .failedRequest)
        } catch {
            print("Unable to decode FlickAPi response: \(error.localizedDescription)")
            
            completionHandler(nil, .failedRequest)
            
            return
        }
    }
}*/

