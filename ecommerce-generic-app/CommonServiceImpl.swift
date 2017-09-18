//
//  CommonServiceImpl.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation

class CommonServiceImpl : CommonServiceProtocol {
    
    typealias HomePageCompletionHandler = (Result<HomePageModel?>) -> ()
    
    //MARK: - Private
    private let network: Network
    
    //MARK: - Lifecycle
    init(network: Network) {
        self.network = network
    }
    func getHomePageData(completion: @escaping HomePageCompletionHandler){
        
        let urlRequest = URLRequest(url: URL(string: "https://en.wikipedia.org/w/api.php")!)
        self.network.getAPIData(with: urlRequest ) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .Error(let error):
                    completion(.Error(error))
                    return
                case .Success(let json):
                    //6 parsing the Json response
                    if let JSON = json as? [String: AnyObject] {
                        let listofHomePageItems = HomePageModel.mappedHomePageModel(JSON)
                        completion(.Success(listofHomePageItems))
                    }else{
                        completion(.Error(.jsonParsingFailure))
                    }
                }
            }
            
            
        }
        
    }

}
