//
//  ListCellViewModel.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation
import UIKit

protocol ListCellViewModelling {
    
    // MARK: INPUT
    
    // MARK: OUTPUT
    func getTitle() -> String
    func getPrice() -> String
    func getImage() -> UIImage?
}

class ListCellViewModel: ListCellViewModelling {
    
    var model: ListCellModel!
    
    init(model: ListCellModel) {
        self.model = model
    }
    
    func getTitle() -> String {
        return model.productName
    }
    
    func getPrice() -> String {
        return model.productPrice
    }
    
    func getImage() -> UIImage? {
        return UIImage.init(named: "product")
    }
}


extension ListCellViewModel: CellRepresentable {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(ListTableViewCell.self)
    }
    
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell : ListTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.prepare(viewModel: self)
        return cell
    }
    
}
