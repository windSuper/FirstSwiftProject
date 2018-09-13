//
//  HomeViewController.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,CarouselDelegate {
    
    
    var infoTable:UITableView=UITableView()
    
    var carousel:CarouselView=CarouselView()
    var topNavView:HomeNavView=HomeNavView()
    var menuView:HomeMenuView=HomeMenuView()
    var gameTyoeView:HomeGameTypeView=HomeGameTypeView()
    var hotRecommandView:HomeHotRecommandView=HomeHotRecommandView()
    
    var bannerArr:NSMutableArray = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.initSubView()
        self.isLoginVertify()
        self.requestBannerData()
        self.view.bringSubview(toFront: self.loading)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isLoginVertify()
    }
    
    func initSubView(){
        
        //导航栏
        topNavView = HomeNavView.init(frame:  CGRect(x: 0, y: 0, width: kScreenWidth, height: 64))
        self.view.addSubview(topNavView)
        
        //轮播图
        carousel = CarouselView.init(frame:  CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth/3))
        carousel.delegate = self
        
        //菜单按钮
        let size = GetScaleWidthPlus(50)
        let menuHeight = size*2+85
        menuView = HomeMenuView.init(frame:  CGRect(x: 0, y: carousel.bottom, width: kScreenWidth, height: menuHeight))
        
        //游戏类型
        gameTyoeView = HomeGameTypeView.init(frame:  CGRect(x: 0, y: menuView.bottom, width: kScreenWidth, height:310))
        
        //热门推荐
        let hotHeight:CGFloat = kScreenWidth>320 ? 210 : 190
        hotRecommandView = HomeHotRecommandView.init(frame:  CGRect(x: 0, y: gameTyoeView.bottom, width: kScreenWidth, height:hotHeight))
        
        //头视图
        let height = kScreenWidth/3+menuHeight+310+hotHeight
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: height))
        
        headerView.addSubview(carousel);
        headerView.addSubview(menuView);
        headerView.addSubview(gameTyoeView);
        headerView.addSubview(hotRecommandView);
        
        infoTable = UITableView.init(frame: CGRect(x: 0, y:64, width: kScreenWidth, height: kScreenHeight-49-64), style: UITableViewStyle.plain)
        infoTable.tableHeaderView = headerView
        infoTable.backgroundColor = UIColor.clear
        self.view.addSubview(infoTable)
    }
    
    func requestBannerData(){
        let parameters1:NSDictionary = [
            "is_banner":"1",
            "is_info":"1",
            "class_id":"",
            "is_m_banner":"",
            "is_list":"",
            "is_m_list":"",
        ]
        RequestAPI.requestActiveListRequest(paramDic: parameters1, successBlock: { (result) in
            let arr:NSArray? = result["active_list"] as? NSArray
            var imgArr:[String] = []
            for i in arr!{
                let model:PromtionModel = PromtionModel.init(dic:i as! NSDictionary)
                self.bannerArr.add(model)
                if model.img4.characters.count>0{
                    imgArr.append(model.img4)
                }
            }
            self.carousel.imagesArr = imgArr
        }, failBlock: { (msg) in
            
        })
    }
    
    func isLoginVertify(){
        RequestAPI.isLoginRequest(successBlock: { (result) in
            let isLoginDic:NSDictionary = result["is_login"] as! NSDictionary
            let status:Int = isLoginDic["status"] as! Int
            //未读消息数
            let msgUserDic = result["msg_user"] as! NSDictionary
            let data = msgUserDic["data"]as! NSDictionary
            let unreadCount = data["count"] as? String
            
            if status==200{
                Global.shared.isLogin = true
                self.requestHotRecommandData()
                self.requestUserInfo()
                if unreadCount != "0"  {
                    self.topNavView.messageNumLB.isHidden = false
                    self.topNavView.messageNumLB.text = unreadCount
                }else{
                    self.topNavView.messageNumLB.isHidden = true
                }
            }else{
                self.autoLogin();
            }
        }) { (msg) in
            HUD.showText(msg)
        }
    }
    
    func autoLogin(){
        
        //login.do
        let parameters:NSDictionary = [
            "username":"wwwwwwww",
            "password":"123456789",
            "iscaptcha":"1",
            ];
        RequestAPI.loginRequest(paramDic: parameters, successBlock: { (result) in
            self.isLoginVertify()
            //保存sessionid
            let cookiesArray = HTTPCookieStorage.shared.cookies
            for cookie in cookiesArray! {
                if (cookie.name == "beegosessionID") {
                    Global.shared.sessionID = cookie.value
                }
            }
        }) { (msg) in
            self.isLoginVertify()
        }
    }
    
    func requestHotRecommandData(){
        let parameters:NSDictionary = [
            "plattype":"mobile",
            "is_hot":"1",
            ];
        RequestAPI.requestPlatGameList(paramDic: parameters, successBlock: { (result) in
            let arr:NSArray = result["data"] as! NSArray
            self.hotRecommandView.dataArr = arr
        }) { (msg) in
            HUD.showText(msg)
        }
        
    }
    
    func requestUserInfo(){
        RequestAPI.getUserInfoRequest(successBlock: { (result) in
            let dic = result["user_info"]
            let model = UserModel.init(dic: dic as! NSDictionary)
            Global.shared.userModel = model
            NotificationCenter.default.post(name: NSNotification.Name(kLoginSuceessNotif), object: nil)
        }) { (msg) in
            
        }
    }
    
    
    //MARK:-CarouselDelegate
    func selectedCarouselIndex(index: Int) {
        let model:PromtionModel = bannerArr[index] as! PromtionModel
        let ctrl:DetailPromtionCtrl = DetailPromtionCtrl()
        ctrl.htmlStr = model.content
        ctrl.actID = model.id
        ctrl.url = model.url
        ctrl.titleStr = model.title
        self.navigationController?.pushViewController(ctrl, animated: true)
    }
}
