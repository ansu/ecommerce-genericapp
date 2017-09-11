//
//  Router.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//


import UIKit

final class Router {
    //MARK: - Private
    var navigationController: UINavigationController
    private let application: Application
    
    //MARK: - Lifecycle
    init(window: UIWindow, application: Application) {
        self.navigationController = UINavigationController()
        self.application = application
        self.navigationController.setNavigationBarHidden(true, animated: true)
        self.start()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
   //MARK: - Public
    func start() {
        let viewModel = HomePageViewModel()
        let instance = UIStoryboard.mainStoryboard?.instantiateVC(HomePageVC.self)
        //instance?.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: instance!)
    }
    
}
