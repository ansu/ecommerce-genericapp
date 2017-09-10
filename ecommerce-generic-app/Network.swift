//
//  Network.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


enum NetworkAPIError: Error, CustomStringConvertible {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case invalidURL
    case jsonParsingFailure
    
    var description: String {
        switch self {
        case .invalidData: return "Received an invalid response"
        case .invalidURL: return "URL is not valid"
        case .responseUnsuccessful: return "Received an invalid response"
        case .jsonParsingFailure: return "Sorry, there was an error in url."
        default: return "Unkown error occurred"
        }
    }
}


protocol Network {
    typealias JSON = [String: AnyObject]
    func getAPIData(with request: URLRequest, completionHandler completion:@escaping (Result<JSON>) -> ())
}

enum Result <T>{
    case Success(T)
    case Error(ItunesApiError)
}

enum ItunesApiError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case invalidURL
    case jsonParsingFailure
}
