//
//  MainTabBarCtrl.swift
//  SwiftProject
//
//  Created by Ric on 18/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class TabBarItem: UIControl {
    
    var isSelect:Bool = false
    var imageView:UIImageView = UIImageView()
    var titleLabel:UILabel = UILabel()
    
    init(frame:CGRect,imageName:String,title:String){
        
        super.init(frame:frame);
        self.isSelect=false;
        
        self.imageView=UIImageView.init(frame: CGRect(x: (frame.width-25)/2, y: (frame.height-25-20)/2, width: 25, height: 25));
        self.imageView.image=UIImage.init(named: imageName);
        self.imageView.contentMode=UIViewContentMode.scaleAspectFill;
        
        self.titleLabel=UILabel.init(frame: CGRect(x:0, y: 25, width: frame.width, height: 20));
        self.titleLabel.textAlignment=NSTextAlignment.center;
        self.titleLabel.textColor=UIColor.white;
        self.titleLabel.font = UIFont.systemFont(ofSize: 12);
        self.titleLabel.text = title;
        
        self.addSubview(self.imageView);
        self.addSubview(self.titleLabel);
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class MainTabBarCtrl: UITabBarController,UINavigationControllerDelegate{
    
    var tbBJImageView:UIImageView = UIImageView();
    var preUnSelectItem:TabBarItem?;
    let imageArr=["home_but","home_but_signin","home_but_service"];
    let titleArray=["首页", "天天签到","客服"];
    let selectImageArr=["home_but_hove","home_but_signin_hover","home_but_service_hover"];
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil);
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(tabbarItemNotifyChange(notif:)), name: NSNotification.Name(kMainBarChangeNotification), object: nil)
        
        //初始化viewControllers
        self.initCtrls()
        //初始化tabBar
        self.initTabBarView()
    }
    
    func initCtrls(){
        
        let home = HomeViewController();
        let sign = SignViewController();
        let service = ServiceViewController();
        let ctrls = [home,sign,service];
        
        var items:[AnyObject]=[];
        for index in 0..<ctrls.count {
            let nav = BaseNavigationCtrl.init(rootViewController: ctrls[index]);
            nav.delegate=self;
            items.insert(nav, at: index)
        }
        
        self.viewControllers=items as? [UIViewController];
        self.selectedIndex=0;
        
    }
    
    
    func initTabBarView(){
        
        let size = CGSize(width: kScreenWidth, height:kTabbarHeight);
        let point = CGPoint(x:0,y:0);
        self.tbBJImageView=UIImageView.init(frame:CGRect(origin: point, size: size));
        self.tbBJImageView.backgroundColor=UIColor.black;
        self.tbBJImageView.isUserInteractionEnabled=true;
        self.tabBar.addSubview(self.tbBJImageView);
        
        self.initBtnView();
        
    }

    func initBtnView(){
        
        let width=kScreenWidth/CGFloat(self.imageArr.count);
        for index in 0..<self.imageArr.count {
            
            let img = self.imageArr[index];
            let title = self.titleArray[index];
            let frame = CGRect(x: width*CGFloat(index), y: 0, width: width, height:kTabbarHeight);
            
            var tabBarItem = self.tbBJImageView.viewWithTag(10+index) as? TabBarItem;
            if(tabBarItem==nil){
                tabBarItem = TabBarItem.init(frame: frame, imageName:img, title: title);
                tabBarItem?.tag=10+index;
                tabBarItem?.addTarget(self, action:#selector(tabBarAction(item:)), for: UIControlEvents.touchUpInside)
                self.tbBJImageView.addSubview(tabBarItem!);
            }
            
            if (index == 0) {
                tabBarItem?.titleLabel.textColor = kMainTitleColor;
                tabBarItem?.imageView.image = UIImage.init(named:self.selectImageArr[0]);
                self.preUnSelectItem = tabBarItem;
                
            } else {
                tabBarItem?.titleLabel.textColor = UIColor.white;
            }
            

            
        }
    }
    
    func tabBarAction(item:TabBarItem){
        let index = item.tag-10;
        let preindex = (self.preUnSelectItem?.tag)!-10;
        if (item != self.preUnSelectItem) {
            
            self.selectedIndex=index;
            
            self.preUnSelectItem?.imageView.image = UIImage.init(named:self.imageArr[preindex]);
            self.preUnSelectItem?.titleLabel.textColor = UIColor.white;
            
            item.titleLabel.textColor = kMainTitleColor;
            item.imageView.image = UIImage.init(named:self.selectImageArr[index]);
            self.preUnSelectItem = item;
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        
        if(navigationController.viewControllers.count>1){
            self.tabBar.isHidden=true;
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if(navigationController.viewControllers.count==1){
            self.tabBar.isHidden=false;
        }
    }
    
    override var shouldAutorotate: Bool{
        return false;
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return self.selectedViewController!.supportedInterfaceOrientations;

    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return self.selectedViewController!.preferredInterfaceOrientationForPresentation;

    }
    
    //MARK:-通知切换
    func tabbarItemNotifyChange(notif:Notification){
        let index:Int = notif.object as! Int
        let item:TabBarItem = tbBJImageView.viewWithTag(index+10) as! TabBarItem
        self.tabBarAction(item: item)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
