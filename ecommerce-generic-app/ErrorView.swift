//
//  Errorview.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.

import UIKit

class ErrorView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var retry: MaterialButton!
    @IBOutlet weak var back: UIButton!

    typealias RetryCompletion = ((Void) -> (Void))?
    typealias BackCompletion = ((Void) -> (Void))?
    
    var retryCompletion: RetryCompletion
    var backCompletion: BackCompletion
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepare()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ErrorView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        back.isHidden = true
        addSubview(view)
    }

    func setup(commentString: String, retryCompletion: RetryCompletion, backCompletion: BackCompletion) {
        self.comment.text = commentString
        self.retryCompletion = retryCompletion
        self.backCompletion = backCompletion
        
        if backCompletion != nil {
           back.isHidden = false
        } else {
            back.isHidden = true
        }
        self.prepare()
    }
    
    func prepare() {
        self.backgroundColor = UIColor.colorFromHexString("#F4F3EF")
        self.comment.textAlignment = .center
        self.comment.font = UIFont.textXL()
        
        UIHelper.setupMaterialButton(button: retry, title: "Retry", bgColor: .primaryBlue(), titleColor: .white, font: .textXL())
        UIHelper.setupNormalButton(button: back, title: "Back", titleColor: .primaryBlue(), font: .textXL())
        retry.addTarget(self, action: #selector(retryAction), for: .touchUpInside)
        
    }

    func retryAction() {
        if self.retryCompletion != nil {
            self.removeFromSuperview()
            self.retryCompletion?()
        }
    }
    func backAction() {
        if self.backCompletion != nil {
            self.removeFromSuperview()
            self.backCompletion?()
        }
    }
    
    deinit {
        print("deinit ErrorView")
    }
}
