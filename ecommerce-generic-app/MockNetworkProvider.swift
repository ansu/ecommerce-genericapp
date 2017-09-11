//
//  MockNetworkProvider.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


class MockNetworkProvider: Network {
    
    //1 creating the session
    let session: URLSession
    
    //MARK: - Lifecycle
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler = (Result<JSON>) -> ()
    
    
    // MARK: service methods
    
    func getAPIData(with request: URLRequest, completionHandler completion:@escaping JSONTaskCompletionHandler){
       
        DispatchQueue.global().async {
            do {
                let filePath = Bundle.main.path(forResource: "HomePage", ofType:"json")
                let data = try! Data(contentsOf: URL(fileURLWithPath:filePath!), options: .uncached)
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                    DispatchQueue.main.async {
                        completion(.Success(json))
                    }
                }
            } catch {
                completion(.Error(.jsonConversionFailure))
            }
        }
     
    }

}

 
