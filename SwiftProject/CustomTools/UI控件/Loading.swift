//
//  Loading.swift
//  SwiftProject
//
//  Created by Ric on 20/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class Loading: UIView {

    var titleLB:UILabel=UILabel();
    var indicator:UIActivityIndicatorView=UIActivityIndicatorView();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor=UIColor.clear;
        self.isUserInteractionEnabled = true
        self.initSubView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        
        
        let container = UIView.init(frame: CGRect(x: (self.width-80)/2, y: (self.height-80)/2, width: 80, height: 80));
        self.addSubview(container);
        
        let bgView = UIView.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80));
        bgView.backgroundColor=UIColor.black;
        bgView.alpha=0.7;
        bgView.layer.cornerRadius=5;
        container.addSubview(bgView);
        
        self.indicator = UIActivityIndicatorView.init(frame: CGRect(x: 20, y: 10, width: 40, height: 40))
        self.indicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.whiteLarge;
        self.indicator.startAnimating();
        container.addSubview(self.indicator);
        
        self.titleLB = UILabel.init(frame: CGRect(x: 0, y:50, width: 80, height: 20))
        self.titleLB.textAlignment=NSTextAlignment.center;
        self.titleLB.textColor=UIColor.white;
        self.titleLB.font = UIFont.systemFont(ofSize: 14);
        self.titleLB.text="加载中...";
        container.addSubview(self.titleLB);
    }

}
