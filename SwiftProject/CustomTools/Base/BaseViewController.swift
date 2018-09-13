//
//  BaseViewController.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var tempTabbarImgView:UIImageView = UIImageView();
    public var loading:Loading = Loading();
    public var navBar:SubNavView = SubNavView();
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=kCtrlBGColor;
        self.navigationController?.navigationBar.isHidden = true;
        self.automaticallyAdjustsScrollViewInsets = false;
        self.initLoading()
        self.initNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if (self.tabBarController?.tabBar) != nil {
            
            self.tempTabbarImgView = UIImageView.init(frame: CGRect(x: 0, y: kScreenHeight-49, width: kScreenWidth, height: 49));
            self.tempTabbarImgView.image=SnapShotTabBarView(view: (self.tabBarController?.tabBar)!, frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49));
            self.view.addSubview(self.tempTabbarImgView);
            
            if(self.navigationController?.childViewControllers.count==2){
                self.tempTabbarImgView.isHidden=true;
            }
        }
    }
    
    func initNavBar(){
        self.navBar = SubNavView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64));
        self.view.addSubview(self.navBar);
    }
    
    func initLoading(){
        self.loading = Loading.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80));
        self.loading.isHidden=true;
        loading.center = self.view.center
        self.view.addSubview(self.loading);
    }
    
    
}
