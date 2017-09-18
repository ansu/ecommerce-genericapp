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
    func getTitle() -> String?
    func getSubTitle() -> String?
    func getPrice() -> String?
    func getImage() -> UIImage?
}

class CollectionCellViewModel: CollectionCellViewModelling {
    
    var model: Item!
    
    init(model: Item) {
        self.model = model
    }
    
    func getTitle() -> String? {
        return self.model.titile
    }
    
    func getSubTitle() -> String? {
        return self.model.subtitle
    }
    
    func getPrice() -> String? {
        return self.model.price
    }
    
    func getImage() -> UIImage? {
        return UIImage.init(named: self.model.image ?? "product")
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
