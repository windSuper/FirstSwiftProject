//
//  HotItem.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HotItem: UIControl {

    var bgImgView:UIImageView = UIImageView()
    var borderImgView:UIImageView = UIImageView()
    var contentImgView:UIImageView = UIImageView()
    var titleLB:UILabel = UILabel()
    
    private let itemSize:CGFloat = (kScreenWidth > 320) ? 110 : 90
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews(){
        
        bgImgView = UIImageView.init(frame: self.bounds)
        bgImgView.image = UIImage.init(named: "homeHotBG")
        self.addSubview(bgImgView)
        
        contentImgView = UIImageView.init(frame: CGRect(x: 5, y: 5, width: itemSize-10 , height: itemSize-10))
        contentImgView.backgroundColor = .clear
        self.addSubview(contentImgView)
        
        borderImgView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 23, height: 24))
        borderImgView.image = UIImage.init(named: "home_hot")
        self.addSubview(borderImgView)
        
        titleLB = UILabel.init(frame:CGRect(x: 0, y: self.height-30, width: self.width , height: 30))
        titleLB.textColor = .black
        titleLB.textAlignment = .center
        titleLB.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(titleLB)
    }
}
