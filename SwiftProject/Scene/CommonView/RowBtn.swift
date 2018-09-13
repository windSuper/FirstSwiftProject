//
//  RowBtn.swift
//  SwiftProject
//
//  Created by Ric on 19/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class RowBtn: UIControl {
    
    var icon:UIImageView = UIImageView()
    var titleLB:UILabel = UILabel()
    var subTitleLB:UILabel = UILabel()
    var indicator:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
        self.backgroundColor = kMainBgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews(){
        
        titleLB = UILabel.init(frame: CGRect(x: 12, y: (self.height-20)/2, width: 80, height: 20))
        titleLB.textColor = .white
        titleLB.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(titleLB)
        
        subTitleLB = UILabel.init(frame: CGRect(x: titleLB.right, y: (self.height-20)/2, width: self.width-144, height: 20))
        subTitleLB.textColor = .white
        subTitleLB.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(subTitleLB)
        
        indicator = UIImageView.init(frame: CGRect(x: self.width-22, y: (self.height-15)/2, width: 10, height: 15))
        indicator.image = UIImage.init(named: "list_next")
        self.addSubview(indicator)
    }
    
}
