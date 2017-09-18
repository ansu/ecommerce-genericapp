//
//  ListTableViewCell.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel! {
        didSet {
           // productName.font = UIFont.boldSystemFont(ofSize: 14)
        }
    }
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel! {
        didSet {
           // self.productName.font = UIFont.systemFont(ofSize: 13)
        }
    }
    
    var viewModel: ListCellViewModelling! {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData() {
        productName.text = viewModel.getTitle()
        productImage.image = viewModel.getImage()
        productPrice.text = viewModel.getPrice()
        
    }
    
    func prepare(viewModel: ListCellViewModelling) {
        self.viewModel = viewModel
    }
    
}
