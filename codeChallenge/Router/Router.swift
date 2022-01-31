//
//  Router.swift
//  codeChallenge
//
//  Created by Sabih Hida Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

import Foundation
extension UIViewController {
    @objc func navigateDetail(photo: [AnyHashable : Any]){
        if let  vc = self.storyboard?.instantiateViewController(withIdentifier:"DetailViewController" ) as? DetailViewController {
            vc.photo = photo
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
