//
//  HomeHotRecommandView.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HomeHotRecommandView: UIView,UIScrollViewDelegate {

    
    private var hotScroll:UIScrollView=UIScrollView()
    private var timer:Timer = Timer()
    private var currentIndex:Int = 1
    private var dataModelArr:NSArray = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews(){
        
        let bg = UIView.init(frame: CGRect(x: 12, y: 10, width:kScreenWidth-24, height: 30))
        bg.backgroundColor = kMainTitleColor
        self.addSubview(bg)
        
        let titleLB = UILabel.init(frame: CGRect(x: 22, y: 10, width:100, height: 30))
        titleLB.textColor = .black
        titleLB.text = "热门推荐"
        titleLB.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(titleLB)
        
        let moreBtn = UIButton.init(frame: CGRect(x: self.width-65,y: 10, width:50, height: 30))
        moreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        moreBtn.setTitle("更多>>", for: .normal)
        moreBtn.setTitleColor(.black, for: .normal)
        moreBtn.backgroundColor = kMainTitleColor;
        moreBtn.addTarget(self, action: #selector(moreBtnAction), for: .touchUpInside)
        self.addSubview(moreBtn)
        
        //初始化滚动图
        self.initHotScroll()
    }
    
    //初始化滚动图
    func initHotScroll(){
        let itemSize:CGFloat = (kScreenWidth>320) ? 110 : 90;
        hotScroll = UIScrollView.init(frame: CGRect(x: 0, y: 40, width: kScreenWidth, height: itemSize+60))
        hotScroll.delegate = self;
        hotScroll.bounces = false;
        hotScroll.isPagingEnabled = true;
        self.addSubview(hotScroll)
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(hotScrollAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    //数据初始化
    var dataArr:NSArray = []{
        
        didSet{
            if dataArr.count>0 {
                self.initHotItem()
                timer.fire()
            }
            
        }
    }
    
    //初始化HotItem
    func initHotItem(){
        let host = UserDefaults.standard.object(forKey: "Host") as! String
        let index = self.dataArr.count/3+self.dataArr.count%3
        hotScroll.contentSize = CGSize(width:CGFloat(index)*kScreenWidth,height:0)
        for i in 0..<dataArr.count {
            let dic:NSDictionary = dataArr[i] as! NSDictionary
            let model = GameModel.init(dic: dic)
            
            let itemSize:CGFloat = (kScreenWidth>320) ? 110 : 90
            let space:CGFloat = (kScreenWidth-CGFloat(3*itemSize)-24)/2
            let x = CGFloat(i/3)*kScreenWidth + CGFloat(i%3)*(space+itemSize) + 12
            let item = HotItem.init(frame: CGRect(x: x, y: 15, width: itemSize, height: itemSize+30))
            item.tag = 700+i
            item.titleLB.text = model.game_title
            let imgUrl = URL(string: host+model.img_url)
            item.contentImgView.kf.setImage(with: imgUrl)
            item.addTarget(self, action: #selector(hotItemAction(item:)), for: .touchUpInside)
            hotScroll.addSubview(item)
        }
        
        
    }
    
    func hotScrollAction(){
        let index = self.dataArr.count/3+self.dataArr.count%3
        if (currentIndex>=index) {
            
            currentIndex = 0;
        }
        hotScroll.setContentOffset(CGPoint(x:CGFloat(currentIndex)*kScreenWidth,y:0), animated: true)
        currentIndex += 1;

    }
    
    func moreBtnAction(){
        
    }
    
    func hotItemAction(item:HotItem){
        let superCtrl:BaseViewController = self.viewController() as! BaseViewController
        superCtrl.loading.isHidden = false
        let tempDic:NSDictionary = dataArr[item.tag-700] as! NSDictionary
        let model = GameModel.init(dic: tempDic)
        let dic = ["plat":model.plat_form,"gametype":model.game_type,
                   "gamename":model.game_name,"gameid":model.game_id,
                   "gamekind":model.game_kind,]
        RequestAPI.requestGameUrl(paramDic: dic as NSDictionary, successBlock: { (result) in
            superCtrl.loading.isHidden = true
            Global.saveHistoryGame(model: model)
            let ctrl:PlayGameCtrl = PlayGameCtrl()
            ctrl.url = result["login_url"] as! String
            let nav:BaseNavigationCtrl = BaseNavigationCtrl.init(rootViewController:ctrl)
            superCtrl.present(nav, animated: true, completion: nil)
        }) { (msg) in
            superCtrl.loading.isHidden = true
            HUD.showText(msg)
        }
    }
}
