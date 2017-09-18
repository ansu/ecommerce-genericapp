//
//  Application.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit
import Foundation

class Application {
    
    private let window: UIWindow

    lazy var navigation: Router = Router(
        window: self.window,
        application: self
    )

    
    
    lazy var network = MockNetworkProvider(session: URLSession.shared)
    lazy var api: CommonServiceProtocol = CommonServiceImpl(network:self.network )
    
   
    //    //MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }

}
