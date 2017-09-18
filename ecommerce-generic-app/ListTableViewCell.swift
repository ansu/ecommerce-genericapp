//
//  ListTableViewCell.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    
    var viewModel: ListCellViewModelling!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(viewModel: ListCellViewModelling) {
        self.viewModel = viewModel
    }
    
}
