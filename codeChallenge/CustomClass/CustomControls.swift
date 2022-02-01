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
extension UIView {
   @objc func showBlurLoader() {
        let blurLoader = BlurLoader(frame: frame)
        self.addSubview(blurLoader)
    }

    @objc func removeBluerLoader() {
        if let blurLoader = subviews.first(where: { $0 is BlurLoader }) {
            blurLoader.removeFromSuperview()
        }
    }
}


 class BlurLoader: UIView {

    var blurEffectView: UIVisualEffectView?

    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        super.init(frame: frame)
        addSubview(blurEffectView)
        addLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLoader() {
        guard let blurEffectView = blurEffectView else { return }
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        activityIndicator.startAnimating()
    }
}
