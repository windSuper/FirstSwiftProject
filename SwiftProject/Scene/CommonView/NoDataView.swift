//
//  NoDataView.swift
//  SwiftProject
//
//  Created by Ric on 16/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class NoDataView: UIView {

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
        
        let view = UIView.init(frame:self.bounds)
        self.addSubview(view)
        
        let y:CGFloat = kScreenHeight > 568 ? 100 : 60
        let imageView = UIImageView.init(frame: CGRect(x: (kScreenWidth-303)/2, y: y, width: 303, height: 180))
        imageView.image = UIImage.init(named: "friend_nodata")
        view.addSubview(imageView)
        
        
        self.titleLB = UILabel.init(frame: CGRect(x: 15, y: imageView.bottom+40, width:kScreenWidth-30 , height: 20))
        self.titleLB.numberOfLines=0
        self.titleLB.text = "暂无数据"
        self.titleLB.textColor=UIColor.white;
        self.titleLB.textAlignment=NSTextAlignment.center;
        self.titleLB.font = UIFont.systemFont(ofSize: 15);
        view.addSubview(self.titleLB);
    }


}
