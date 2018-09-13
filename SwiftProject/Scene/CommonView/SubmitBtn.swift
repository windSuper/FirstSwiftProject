//
//  SubmitBtn.swift
//  SwiftProject
//
//  Created by Ric on 19/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SubmitBtn: UIButton {

    var title:String = "确认"{
        
        didSet{
            self.setTitle(title, for: .normal)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 3
        self.backgroundColor = kMainTitleColor
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
