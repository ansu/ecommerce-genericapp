//
//  HomePageVC.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class HomePageVC: BaseVC {

    var viewModel : HomePageViewModelling!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.automaticallyAdjustsScrollViewInsets = false
            self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.interactive
            self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
            tableView.allowsSelection = false
            tableView.estimatedRowHeight = 400
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.screenLoaded()
        setupViews()
        setupBinding()
        
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
        
        viewModel.showErrorView = { [unowned self] (message, retryClosure) in
            self.showErrorView(errorMsg: message, retry: retryClosure, back: nil)
        }
 
    }
    
    private func setupViews() {
        self.viewModel.tableItemTypes.forEach { [unowned self]  in
            $0.registerCell(tableView: self.tableView)
        }
    }
}

extension HomePageVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let viewModel = self.viewModel.tableViewDataSource[indexPath.row]
         let cell = viewModel.cellInstance(tableView: tableView, indexPath: indexPath)
         return cell
    }
    
}

extension HomePageVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.viewModel.searchViewModels[indexPath.row].cellSelected()
    }
}

