//
//  CollectionViewCell.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel! {
        didSet {
        
        }
    }
    
    @IBOutlet weak var subTitle: UILabel! {
        didSet {
        
        }
    }
    
    @IBOutlet weak var productImage: UIImageView! {
        didSet {
        
        }
    }
    
    @IBOutlet weak var price: UILabel! {
        didSet {
            
        }
    }
    
    var viewModel: CollectionCellViewModelling! {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepare(viewModel: CollectionCellViewModelling) {
        self.viewModel = viewModel
    }
    
    func setData() {
        self.title.text = viewModel.getTitle()
        self.subTitle.text = viewModel.getSubTitle()
        self.productImage.image = viewModel.getImage()
        self.price.text = viewModel.getPrice()
    }
}
