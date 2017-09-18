//
//  CollectionCellViewModel.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionCellViewModelling {
    
    // MARK: INPUT
    
    // MARK: OUTPUT
}

class CollectionCellViewModel: CollectionCellViewModelling {
    
    var model: Item!
    
    init(model: Item) {
        self.model = model
    }
}


extension CollectionCellViewModel: collectionCellRepresentable {
    
    static func registerCell(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell" )
    }
    
    func cellInstance(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.prepare(viewModel: self)
        return cell
    }
    
}
