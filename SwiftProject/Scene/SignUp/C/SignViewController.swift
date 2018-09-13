//
//  SignViewController.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SignViewController: BaseViewController {

    var totalDaysLB:UILabel = UILabel()
    var surpriseBtn:UIButton = UIButton()
    var infoScrollView:UIScrollView = UIScrollView()
    var signSuccessView:SignUpSuccessView = SignUpSuccessView()
    
    var gifArr:NSArray=[]
    var titleArr:NSArray=[]
    var dataArr:NSMutableArray=[]
    
    var bigSurpriseStatus:String = "103"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNav();
        self.initHeaderView()
        self.initSignItemView()
        self.initSignSuccessView()
        self.view.bringSubview(toFront: self.loading)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.requestSignList()
        self.bigSignUpCondition()
    }

    func initNav(){
        let navView = NavView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64));
        navView.titleLB.text = "天天签到";
        self.view.addSubview(navView);
        
        infoScrollView = UIScrollView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64-49))
        infoScrollView.contentSize = CGSize(width: 0, height: GetScaleWidthIphone5(560))
        self.view.addSubview(infoScrollView)
    }
    
    func initSignSuccessView(){
        signSuccessView = SignUpSuccessView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        signSuccessView.alpha = 0
        signSuccessView.backgroundColor = UIColor.clear
        self.view.addSubview(signSuccessView)
    }
    
    func initHeaderView(){
        
        let bgView:UIView = UIView.init(frame: CGRect(x: 0, y: 15, width: kScreenWidth, height: 60))
        bgView.backgroundColor=ColorFromOX(rgbValue: 0x191919)
        infoScrollView.addSubview(bgView)
        
        let line:UIView = UIView.init(frame: CGRect(x: 12, y: 10, width: 5, height: 40))
        line.backgroundColor=ColorFromOX(rgbValue: 0xd46c00)
        bgView.addSubview(line)
        
        let text:String=kScreenWidth>320 ? "签满25天还有月签到大礼包等着您！" : "签满25天有签到大礼包等您！"
        let promptLB:UILabel = UILabel.init(frame: CGRect(x: 25, y: 10, width: kScreenWidth-135, height: 20))
        promptLB.text = text
        promptLB.textColor=UIColor.white
        promptLB.font=UIFont.systemFont(ofSize: 13)
        bgView.addSubview(promptLB)
        
        
        let dayText:String="本月已累计签到 0 天"
        totalDaysLB = UILabel.init(frame: CGRect(x: 25, y: 30, width: kScreenWidth-135, height: 20))
        totalDaysLB.text=dayText;
        totalDaysLB.textColor=kPlaceHolderColor
        totalDaysLB.font=UIFont.systemFont(ofSize: 11)
        bgView.addSubview(totalDaysLB)
        
        surpriseBtn = UIButton.init(frame: CGRect(x: kScreenWidth-110, y: 9, width: 105, height: 42))
        surpriseBtn.setBackgroundImage(UIImage.init(named: "surpris_normal"), for: UIControlState.normal)
        surpriseBtn.addTarget(self, action: #selector(bigSurpriseAction), for: UIControlEvents.touchUpInside)
        bgView.addSubview(surpriseBtn)
    }
    
    
    func initSignItemView(){
        
        let iconArr:NSArray = ["signin_png_bonus","signin_png_fanshui",
                              "signin_png_bonus2","signin_png_fanshui2",
                              "signin_png_vipdouble"];
        gifArr = ["signin_gif_bonus@3x","signin_gif_fanshui@3x",
                  "signin_gif_bonus2@3x","signin_gif_fanshui2@3x",
                  "signin_gif_vipdouble@3x"];
        titleArr = ["8元奖金","0.05%返水","18元奖金","0.1%返水","38元现金",
                    "28元奖金","0.15%返水","38元奖金","0.2%返水","投注额5%",
                    "48元奖金","0.25%返水","58元奖金","0.3%返水","88元现金",
                    "68元奖金","0.35%返水","78元奖金","0.4%返水","投注额10%",
                    "88元奖金","0.45%返水","98元奖金","0.5%返水","188元现金",];
        
        for i in 0..<titleArr.count{
            
            let space:CGFloat = (kScreenWidth-GetScaleWidthIphone5(53)*5)/6
            let x:CGFloat = space+CGFloat(i%5)*(space+GetScaleWidthIphone5(53))
            let y:CGFloat = 75+GetScaleWidthIphone5(15)+(GetScaleWidthIphone5(75)*CGFloat(i/5))
            let item:SignItem = SignItem.init(frame: CGRect(x: x, y: y, width: GetScaleWidthIphone5(53), height: GetScaleWidthIphone5(60)))
            item.tag = 2700+i;
            item.isEnabled = false;
            item.bgImg.image = UIImage.init(named:"signin_background");
            item.titleLB.text = titleArr[i] as? String;
            item.icon.image = UIImage.init(named:iconArr[i%5] as! String)
            item.badgeLB.text = "\(i)天";
            item.addTarget(self, action: #selector(signAction(btn:)), for: UIControlEvents.touchUpInside)
            infoScrollView.addSubview(item)
        }
        
        
        let signBtn:UIButton = UIButton.init(frame: CGRect(x: 15, y: GetScaleWidthIphone5(475), width: kScreenWidth-30, height: 55))
        signBtn.setImage(UIImage.init(named: "signin_but"), for: UIControlState.normal)
        signBtn.addTarget(self, action: #selector(signAction(btn:)), for: UIControlEvents.touchUpInside)
        infoScrollView.addSubview(signBtn)
    }
    
    
    //MARK:- DataRequest
    func bigSignUpCondition(){
        RequestAPI.signUpBigSurpriseConditionRequest(successBlock: { (result) in
            self.bigSurpriseStatus = result["type"] as! String;
            var img = UIImage.init(named: "surpris_normal")
            if (self.bigSurpriseStatus=="200") {
                img = UIImage.init(named:"surpris_show");
            }else if (self.bigSurpriseStatus=="103") {
                img = UIImage.init(named:"surpris_normal")
            }else if(self.bigSurpriseStatus=="104"){
                img = UIImage.init(named:"surpris_success")
            }
            
            self.surpriseBtn.setBackgroundImage(img, for: .normal)

        }) { (msg) in
            
        }
    }
    
    
    func requestSignList(){
        
        //login.do
        
        RequestAPI.getSignList(successBlock: { (result) in
            
            let arr:NSArray = result["mark_list"] as! NSArray
            for i in 0..<arr.count{
                let item:SignItem = self.infoScrollView.viewWithTag(2700+i) as! SignItem;
                item.titleLB.text = "已签";
                item.alpha = 0.5;
            }
            //下一个可以签到的按钮显示
            let item:SignItem = self.infoScrollView.viewWithTag(2700+arr.count) as! SignItem;
            item.icon.loadGif(name: self.gifArr[arr.count%5] as! String)
            item.bgImg.image = UIImage.init(named:"signin_backgroundhover");
            item.isEnabled = true
            
        }, failBlock: { (msg) in
            HUD.showText(msg)
        })
    }
    
    //签到大礼包
    func signUpBigSurprise(btn:UIButton){
        btn.isEnabled = false
        self.loading.isHidden = false
        RequestAPI.signBigSurpriseReqeust(successBlock: { (result) in
            btn.isEnabled = true
            self.loading.isHidden = true
            self.signSuccessView.signSuccessLB.text = result["content"] as? String
            self.signSuccessView.show()
            self.surpriseBtn.setImage(UIImage.init(named: "surpris_success"), for: .normal)
        }, failBlock: { (msg) in
            btn.isEnabled = true
            self.loading.isHidden = true
            HUD.showText(msg)
        })
    }
    
    
    //MARK:- BtnAction
    func bigSurpriseAction(btn:UIButton){
        if (self.bigSurpriseStatus=="200") {
           self.signUpBigSurprise(btn: btn)
        }else if(self.bigSurpriseStatus=="104"){
            HUD.showText("您已经领取过本月大礼包了，下个月再领取新的大礼包^_^")
        }else{
            HUD.showText("您还未满足领取大礼包的条件")
        }
    }
    

    //签到
    func signAction(btn:UIButton){
        btn.isEnabled = false
        self.loading.isHidden = false
        RequestAPI.signUpRequest(successBlock: { (result) in
            btn.isEnabled = true
            self.loading.isHidden = true
            let item:SignItem = self.infoScrollView.viewWithTag(btn.tag) as! SignItem;
            let title = "恭喜您获得"+item.titleLB.text!
            self.signSuccessView.signSuccessLB.text = title
            self.signSuccessView.show()
        }) { (msg) in
            btn.isEnabled = true
            self.loading.isHidden = true
            HUD.showText(msg)
            
        }
        
    }
    
}
