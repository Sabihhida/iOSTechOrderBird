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
        if image == nil {
            self.image = PlaceHolderImage
        }
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


extension UIViewController {
@objc func showAlert(controller:UIViewController,msg:String, completion: (() -> Void)? = nil) {
    
    let alert = UIAlertController(title:nil,message: msg,preferredStyle: .alert)
    alert.view.layer.cornerRadius = 1
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            completion?()
            alert.dismiss(animated: true)
    }))
    controller.present(alert,animated: true)
}
}
