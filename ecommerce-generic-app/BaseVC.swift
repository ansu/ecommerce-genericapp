//
//  BaseVC.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    internal var activityIndicatorView : RUIActivityIndicatorView!
    
    var trasparentView  = UIView()

    lazy var errorView: ErrorView = ErrorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    fileprivate func initViewController() {
        activityIndicatorView = RUIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.center = self.view.center
        activityIndicatorView.stopAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
    
    
    
    func showActivityIndicator() {
        activityIndicatorView.startAnimating()
        self.view.bringSubview(toFront: activityIndicatorView)
    }
    
    
    
    func hideActivityIndicator() {
        activityIndicatorView.stopAnimating()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
    }
    
    func showErrorView(errorMsg: String, retry: (() -> (Void))? = nil, back: (() -> (Void))? = nil) {
        errorView.setup(commentString: errorMsg, retryCompletion: retry, backCompletion: back)
        errorView.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREENWIDTH, height: ScreenSize.SCREENHEIGHT)
        self.view.addSubview(errorView)
        
    }
    
    func hideErrorView() {
        errorView.removeFromSuperview()
    }
    
    func showAlertView(alertMsg: String, alertTitle: String = "Alert") {
        UIHelper.showAlert(withTitle: alertTitle, controller: self, description: alertMsg, handler: nil)
    }

}

class RUIActivityIndicatorView: UIActivityIndicatorView {
    
    override init(activityIndicatorStyle style: UIActivityIndicatorViewStyle) {
        super.init(activityIndicatorStyle: style)
        _initRUIActivityIndicatorView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _initRUIActivityIndicatorView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _initRUIActivityIndicatorView()
    }
    
    fileprivate func _initRUIActivityIndicatorView() {
        self.hidesWhenStopped = true
        self.color = UIColor.gray
    }
}
