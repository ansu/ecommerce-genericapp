//
//  Helper.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit


struct UIHelper {
    
    
    static func setupMaterialButton(button: MaterialButton, title: String, bgColor: UIColor, titleColor: UIColor?, font: UIFont) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = bgColor
        if titleColor != nil {
            button.setTitleColor(titleColor!, for: .normal)
        }
    }
    
    static func setupNormalButton(button: UIButton, title: String, titleColor: UIColor?, font: UIFont) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        if titleColor != nil {
            button.setTitleColor(titleColor!, for: .normal)
        }
    }
    
    static func showAlert(withTitle title:String, controller: UIViewController,description: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(defaultAction)
        controller.present(alertController, animated: true, completion: nil)
    }
}
