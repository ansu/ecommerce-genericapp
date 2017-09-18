//
//  CollectionTableViewCell.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit
let screenSize = UIScreen.main.bounds

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rightArrowButton: UIButton!
    @IBOutlet weak var leftArrowButton: UIButton!
    
    var viewModel: CollectionTableCellViewModelling!
    fileprivate var noOfItems : Int = 0
    fileprivate var indexnumber: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionHeight.constant = screenSize.height/3
        
        // Action for next image
        rightArrowButton.addTarget(self, action: #selector(moveToright), for: .touchUpInside)
        
        // Action for prev image
        leftArrowButton.isHidden = true
        leftArrowButton.addTarget(self, action: #selector(moveToLeft), for: .touchUpInside)
    }
    
    func prepare(viewModel: CollectionTableCellViewModelling) {
        self.viewModel = viewModel
    }
    
    // Move to next Image
    func moveToright(_ sender: Any){
        
        if indexnumber < (noOfItems - 1){
            
            leftArrowButton.isHidden = false
            indexnumber += 1
            collectionView?.scrollToItem(at: IndexPath(item: indexnumber, section: 0), at: .right, animated: true)
            
            if(indexnumber == noOfItems - 1){  //Hide arrow button if there is no more images available
                rightArrowButton.isHidden = true
            }
        }
    }
    
    // Move to previous image
    func moveToLeft(_ sender: Any){
        
        if indexnumber > 0 {
            rightArrowButton.isHidden = false
            indexnumber -= 1
            collectionView?.scrollToItem(at: IndexPath(item: indexnumber, section: 0), at: .left, animated: true)
            
        }
        
        if(indexnumber == 0){   // Hide left arrow button if there is no more images
            leftArrowButton.isHidden = true
        }
    }
}


extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Return number of rows for each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfItems
    }
    
    // For each row dispaly cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let policyCell = cell as! HomePageCollectionView
//        policyCell.policyImage.image = imageArray[indexPath.row]
//        policyCell.pageControl.currentPage = indexPath.row
        
    }

}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenSize.width, height: screenSize.height/3)
    }
    
}
