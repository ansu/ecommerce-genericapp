//
//  Dynamic.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation

///  WS: Generic Binding
/// Usage: var isLoading : Dynamic<Bool> = Dynamic(false)
class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
}
