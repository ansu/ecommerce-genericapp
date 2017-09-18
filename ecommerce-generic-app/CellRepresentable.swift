//
//  CellRepresentable.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit


protocol CellRepresentable {
    static func registerCell(tableView: UITableView)
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
}

protocol collectionCellRepresentable {
    
    static func registerCell(collectionView: UICollectionView)
    func cellInstance(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}

extension CellRepresentable {
    
    func cellSelected() -> Void {
        
    }
}
