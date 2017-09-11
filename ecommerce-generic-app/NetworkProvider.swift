//
//  NetworkProvider.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


class NetworkProvider: Network {
    
    //1 creating the session
    let session: URLSession
    
    //MARK: - Lifecycle
    init(session: URLSession = URLSession.shared) {
        self.session = session
        
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler = (Result<JSON>) -> ()
   
    
    // MARK: service methods
    
    func getAPIData(with request: URLRequest, completionHandler completion:@escaping JSONTaskCompletionHandler) {
        
        let task = self.session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.Error(.requestFailed))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                            DispatchQueue.main.async {
                                completion(.Success(json))
                            }
                        }
                    } catch {
                        completion(.Error(.jsonConversionFailure))
                    }
                } else {
                    completion(.Error(.invalidData))
                }
            } else {
                completion(.Error(.responseUnsuccessful))
                print("\(error)")
            }

        }
        task.resume()
        
    }
    
    
}
