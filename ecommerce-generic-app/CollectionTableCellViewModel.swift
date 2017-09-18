//
//  CollectionTableCellViewModel.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionTableCellViewModelling {
    
    // MARK: INPUT
    var collectionItemTypes: [collectionCellRepresentable.Type] { get }
    var collectionViewDataSource: [collectionCellRepresentable] { get }
    
    // MARK: OUTPUT
}

class CollectionTableCellViewModel: CollectionTableCellViewModelling {
    
    var collectionItemTypes: [collectionCellRepresentable.Type] = [CollectionCellViewModel.self]
    var collectionViewDataSource: [collectionCellRepresentable] = []
    
    var model: CollectionDataModel!
    private var numberOfItems: Int!
    init(model: CollectionDataModel) {
        self.model = model
        
        numberOfItems = self.model.data?.count ?? 0
        self.collectionViewDataSource = getData()
    }
    
    func getData() -> [collectionCellRepresentable] {
        
        guard let data = model.data else {
            return []
        }
        
        return (0..<numberOfItems).map { index in
            let viewModel = CollectionCellViewModel.init(model: data[index])
            return viewModel
        }
    }
}


extension CollectionTableCellViewModel: CellRepresentable {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
    }
    
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as! CollectionTableViewCell
        cell.prepare(viewModel: self)
        return cell
    }
    
}
