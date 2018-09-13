
//
//  SubNavView.swift
//  SwiftProject
//
//  Created by Ric on 12/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SubNavView: UIView {

    var titleLB:UILabel = UILabel();
    var backBtn:UIButton = UIButton();
    var addBtn:UIButton = UIButton();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor=UIColor.black;
        self.initSubView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        self.backBtn = UIButton.init(frame: CGRect(x: 0, y:27, width: 60, height: 30))
        backBtn.setImage(UIImage.init(named: "nav_back_icon"), for: .normal)
        backBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        backBtn.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        self.addSubview(self.backBtn);
        
        let lb = UILabel.init(frame: CGRect(x:30, y:0, width: 40, height: 30))
        lb.text = "返回"
        lb.textColor=kMainTitleColor;
        lb.font = UIFont.systemFont(ofSize: 13);
        backBtn.addSubview(lb)
        
        self.titleLB = UILabel.init(frame: CGRect(x:(kScreenWidth-120)/2, y:20+12, width: 120, height: 20))
        self.titleLB.textAlignment=NSTextAlignment.center;
        self.titleLB.textColor=UIColor.white;
        self.titleLB.font = UIFont.systemFont(ofSize: 16);
        self.addSubview(self.titleLB);
        
        addBtn = UIButton.init(frame: CGRect(x: kScreenWidth-40, y:26, width: 33, height: 33))
        addBtn.setImage(UIImage.init(named: "nav_menu_icon"), for: .normal)
        addBtn.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        self.addSubview(self.addBtn);
    }

    func popAction(){
        if((self.viewController().navigationController?.viewControllers.count)!>1){
            self.viewController().navigationController?.popViewController(animated: true)
        }else{
            self.viewController().dismiss(animated: true, completion: nil)
        }
    }
}
