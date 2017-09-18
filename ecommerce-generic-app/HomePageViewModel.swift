//
//  HomePageViewModel.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation

typealias ErrorViewDataType = ((String, (() -> Void)?))
protocol HomePageViewModelling {
    
    // MARK: INPUT
    var tableItemTypes: [CellRepresentable.Type] { get }
    var tableViewDataSource: [CellRepresentable] { get }
    func screenLoaded() -> Void
    
    //MARK: OUTPUT
    var showErrorView: ((ErrorViewDataType) -> Void)? { get set }
    var isLoading : Dynamic<Bool>  { get }
    var didUpdate: (() -> Void)? { get set}
    var content :[Content] {get}

}

class HomePageViewModel: HomePageViewModelling {
    
    //Mark Input
    private(set) var isLoading : Dynamic<Bool> = Dynamic(false)
   
    // Mark Output
    var showErrorView: ((ErrorViewDataType) -> Void)?
    var didUpdate: (() -> Void)?
    
    
    var content :[Content] = [Content]()
   
    
    //MARK: - Private
    private let api: CommonServiceProtocol
    
    //MARK: - Properties
    var tableViewDataSource: [CellRepresentable] = []
    var tableItemTypes: [CellRepresentable.Type] = [ListCellViewModel.self, CollectionTableCellViewModel.self]

    //MARK: - Lifeycle
    init(api: CommonServiceProtocol) {
        self.api = api
  
    }
    
    func screenLoaded() -> Void {
        self.callHomePageAPI()
    }
    
    func callHomePageAPI(){
        self.isLoading.value = true
        self.api.getHomePageData() {[unowned self] (result) in
            self.isLoading.value = false
            switch result {
                case .Success(let data):
                    self.content = (data?.content!)!
                    self.didUpdate?()
                    self.tableViewDataSource = self.getData()
                case .Error(let error):
                    print(error.description)
                    self.showErrorView?((error.description, self.retryClosure))
            }
            
        }
    }
    
    func retryClosure() -> Void {
        self.callHomePageAPI()
    }
    
    func getData() -> [CellRepresentable] {
        
        return (0..<content.count).map { [unowned self] index in
            
            let layoutType = self.content[index].layoutType!
            
            switch layoutType {
                case "collection": return self.returnCollectionCellViewModel(index)
                case "list": return self.returnListViewModel(index)
                default: return self.returnListViewModel(index)
            }
        }
    }
    
    func returnListViewModel(_ index: Int) -> ListCellViewModel {
        let data = self.content[index].items
        let items = data?.first
        let model = ListCellModel.init(productName: items?.titile ?? "", productPrice: items?.price ?? "", productImageUrl: items?.image ?? "")
        return ListCellViewModel.init(model: model)
    }
    
    func returnCollectionCellViewModel(_ index: Int) -> CollectionTableCellViewModel {
        let model = CollectionDataModel.init(data: self.content[index].items)
        return CollectionTableCellViewModel.init(model: model)
    }

}
