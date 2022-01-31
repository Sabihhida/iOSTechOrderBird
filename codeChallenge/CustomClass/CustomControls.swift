//
//  CustomControls.swift
//  codeChallenge
//
//  Created by Sabih Hida Tahir on 31/01/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {

    @objc public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage,completion:@escaping (UIImage) -> ()) {
        debugPrint(urlString)
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    completion(image)
                }

            }

        }).resume()
    }}



