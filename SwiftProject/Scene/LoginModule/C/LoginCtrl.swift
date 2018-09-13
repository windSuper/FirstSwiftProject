//
//  LoginCtrl.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class LoginCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNav();
        self.initSubView();
    }
    
    func initNav(){
        let navView = NavView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64));
        navView.titleLB.text = "登录";
        self.view.addSubview(navView);
    }
    
    func initSubView(){
        
        let btn = UIButton.init(frame: CGRect(x: 100, y: 100, width: 60, height: 30));
        btn.setTitle("返回", for: .normal);
        btn.backgroundColor=UIColor.orange;
        btn.addTarget(self, action:#selector(loginAction), for: UIControlEvents.touchUpInside);
        self.view.addSubview(btn);
    
    }
    
    func loginAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
