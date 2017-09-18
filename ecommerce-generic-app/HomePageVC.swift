//
//  HomePageVC.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class HomePageVC: BaseVC {

    
    var viewModel : HomePageViewModel!

    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.interactive
            self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    private func setupBinding(){
        
        viewModel?.isLoading.bindAndFire({
            if ($0){
                self.showActivityIndicator()
                self.tableView.isHidden = true
            }else{
                self.hideActivityIndicator()
                self.tableView.isHidden = false
            }
        })
        
        viewModel?.didUpdate = { [weak self] _ in
            self?.tableView.reloadData()
        }
        viewModel?.didError  = { [weak self] error in
            //self?.viewModelDidError(error: error)
        }
        
        
        
        
    }


}


extension HomePageVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.viewModel.searchViewModels.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        //let cellViewModel = self.viewModel.searchViewModels[indexPath.row]
//        let cell =  cellViewModel.cellInstance(tableView: tableView, indexPath: indexPath as NSIndexPath)
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        return cell
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension HomePageVC : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.viewModel.searchViewModels[indexPath.row].cellSelected()
    }
}

