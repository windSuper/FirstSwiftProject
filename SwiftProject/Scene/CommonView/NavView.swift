
//
//  NavView.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class NavView: UIView {
    
    var titleLB:UILabel = UILabel();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor=UIColor.black;
        self.initSubView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        
        self.titleLB = UILabel.init(frame: CGRect(x: (kScreenWidth-120)/2, y:20+12, width: 120, height: 20))
        self.titleLB.textAlignment=NSTextAlignment.center;
        self.titleLB.textColor=UIColor.white;
        self.titleLB.font = UIFont.systemFont(ofSize: 16);
        self.addSubview(self.titleLB);
    }

}
