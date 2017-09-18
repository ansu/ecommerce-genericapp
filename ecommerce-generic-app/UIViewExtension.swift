//
//  UIViewExtension.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}


protocol NibLoadableView: class {
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self()), bundle: nil)
    }
}



extension UITableView {
    
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.defaultReuseIdentifier , bundle: bundle)
        
        return register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerWithIdentifier<T: UITableViewCell>(_: T.Type, identifier:String) where T: ReusableView, T: NibLoadableView{
        register(T.nib, forCellReuseIdentifier:identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusableView {
        return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
    
}
