//
//  Application.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class Application {
    
    private let window: UIWindow

    lazy var navigation: Router = Router(
        window: self.window,
        application: self
    )

    lazy var network = NetworkProvider(session: URLSession.shared)
    lazy var commonServiceAPI = CommonServiceImpl()


    //    //MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }

}
