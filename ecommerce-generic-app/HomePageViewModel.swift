//
//  HomePageViewModel.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


class HomePageViewModel {
    
    
    //Mark Input
    private(set) var isLoading : Dynamic<Bool> = Dynamic(false)
    
    var didUpdate: (() -> Void)?
    var didError: ((Error) -> Void)?
   // var didSelectIndex: ((SearchItem) -> Void)?
    
    //MARK: - Private
    private let api: CommonServiceProtocol
    
    //MARK: - Properties
    //let searchViewModelsTypes: [CellRepresentable.Type] = [SearchCellViewModel.self]
    //private(set) var searchViewModels = [CellRepresentable]()
    
    //MARK: - Lifeycle
    init(api: CommonServiceProtocol) {
        self.api = api
       // callSearchAPI()
    }

}
