//
//  SignUpSuccessView.swift
//  SwiftProject
//
//  Created by Ric on 9/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SignUpSuccessView: UIView {

    var signSuccessLB:UILabel = UILabel()
    var promLB:UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        let bgView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        bgView.backgroundColor=kCtrlBGColor
        bgView.alpha=0.8
        self.addSubview(bgView);
        
        let x = (kScreenWidth-225)/2
        let closeBtn = UIButton.init(frame: CGRect(x: x+215, y: 140, width: 20, height: 20))
        closeBtn.setImage(UIImage.init(named: "signinclose"), for: .normal)
        closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
        self.addSubview(closeBtn)
        
        let sucessIcon = UIImageView.init(frame: CGRect(x: x, y: 150, width: 225, height: 216))
        sucessIcon.image=UIImage.init(named: "signin")
        self.addSubview(sucessIcon)
        self.insertSubview(closeBtn, aboveSubview: sucessIcon)
        
        signSuccessLB = UILabel.init(frame: CGRect(x: x+10, y: sucessIcon.bottom-20, width: 205, height: 30))
        signSuccessLB.textColor=UIColor.white
        signSuccessLB.backgroundColor=UIColor.red
        signSuccessLB.font = UIFont.systemFont(ofSize: 14)
        signSuccessLB.textAlignment = .center
        self.addSubview(signSuccessLB)
        
        promLB = UILabel.init(frame: CGRect(x: x+10, y: signSuccessLB.bottom+10, width: 205, height: 15))
        promLB.textColor=UIColor.red
        promLB.text = "连续签到更多惊喜呦!"
        promLB.font = UIFont.systemFont(ofSize: 12)
        promLB.textAlignment = .center
        self.addSubview(promLB)
    }
    
    func show(){
        UIView.animate(withDuration: 0.35) { 
            self.alpha=1
        }
    }
    
    
    func close(){
        UIView.animate(withDuration: 0.35) {
            self.alpha=0
        }
    }

}
