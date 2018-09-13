//
//  HomeGameTypeView.swift
//  SwiftProject
//
//  Created by Ric on 10/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HomeGameTypeView: UIView {

    var horseLB:HorseRaceLampView  = HorseRaceLampView()
    private var typeSegment:UISegmentedControl  = UISegmentedControl()
    private var noticeBtn:UIControl  = UIControl()
    private var lastIndex:Int = 0
    private var type1View = UIView()
    private var type2View = UIView()
    private var moneyLB = UILabel()
    
    private var channelBtn1 = UIButton()
    private var channelBtn2 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        let bgView = UIView.init(frame: CGRect(x: 12, y: 0, width: self.width-24, height: self.height))
        bgView.backgroundColor = kMainBgColor
        self.addSubview(bgView)
        
        self.initNoticeView()
        self.initGameTypeView()
    }
    
    func initNoticeView(){
        
        noticeBtn = UIControl.init(frame: CGRect(x: 22, y: 10, width:kScreenWidth-44, height: 20))
        
        let noticeImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width:20, height: 20))
        noticeImg.image = UIImage.init(named: "home_news")
        
        let noticeTitleLB = UILabel.init(frame: CGRect(x: noticeImg.right+10, y: 0, width:70, height: 20))
        noticeTitleLB.text = "最新公告:"
        noticeTitleLB.font = UIFont.systemFont(ofSize: 14)
        noticeTitleLB.textColor = kMainTitleColor
        
        horseLB = HorseRaceLampView.init(frame: CGRect(x: noticeTitleLB.right+10, y: 0, width:kScreenWidth-166, height: 20))
        horseLB.textColor = kMainTitleColor
        horseLB.font = UIFont.systemFont(ofSize: 12)
        horseLB.text = "fnlfkdnvlkfsdpfdfpvmpfsdvm"
        
        noticeBtn.addSubview(noticeImg)
        noticeBtn.addSubview(noticeTitleLB)
        noticeBtn.addSubview(horseLB)
        self.addSubview(noticeBtn)
    }

    func initGameTypeView(){
        typeSegment = UISegmentedControl.init(items: ["游戏类型","热门平台"])
        if(kScreenWidth>320){
            typeSegment.frame = CGRect(x:22, y:noticeBtn.bottom+15, width:kScreenWidth-44, height:35);
        }else{
            typeSegment.frame = CGRect(x:12, y:noticeBtn.bottom+15, width:kScreenWidth-24, height:35);
        }
        let font = UIFont.systemFont(ofSize: 15)
        let color = UIColor.white
        let selectedColor = UIColor.black
        let attr = [NSFontAttributeName:font,NSForegroundColorAttributeName:color]
        let selectedAttr = [NSFontAttributeName:font,NSForegroundColorAttributeName:selectedColor]
        typeSegment.setTitleTextAttributes(attr, for: .normal)
        typeSegment.setTitleTextAttributes(selectedAttr, for: .selected)
        typeSegment.selectedSegmentIndex = 0
        typeSegment.addTarget(self, action: #selector(segIndexAction(item:)), for: .valueChanged)
        typeSegment.tintColor = kMainTitleColor
        self.addSubview(typeSegment)
        
        //类型1游戏类型
        self.initType1View()
        
        //类型2游戏平台
        self.initType2View()

    }
    
    func initType1View(){
        
        type1View = UIView.init(frame: CGRect(x: 0, y: typeSegment.bottom+10, width:kScreenWidth, height: 220))
        self.addSubview(type1View)
        
        let imageArr = ["home_game_slotmachines","home_game_live",
                        "home_game_football","home_game_caipao"];
        let titleArr = ["电子游戏","真人现场","体育投注","彩票投注"];
        let space = (kScreenWidth>320) ? (kScreenWidth-300)/3:(kScreenWidth-280)/3
        let offsetX:CGFloat = (kScreenWidth>320) ? 22 : 12
        for i in 0..<titleArr.count {
            let x = offsetX+CGFloat(i)*(space+64)
            let btn = UIButton.init(frame: CGRect(x: x, y: 10, width: 64, height: 64))
            btn.tag = 500+i
            btn.setImage(UIImage.init(named:imageArr[i]), for: .normal)
            btn.addTarget(self, action: #selector(type1BtnAction(item:)), for: .touchUpInside)
            
            let titleLB = UILabel.init(frame: CGRect(x: x, y: btn.bottom+10, width:64, height: 20))
            titleLB.text = titleArr[i]
            titleLB.textAlignment = .center
            titleLB.textColor = UIColor.white
            titleLB.font = UIFont.systemFont(ofSize: 12)
            
            type1View.addSubview(btn)
            type1View.addSubview(titleLB)
        }
        
        //线路切换
        self.initChannelView()
        //充值视图
        self.initRechargeView()
    }
    
    //线路
    func initChannelView(){
        let host:String = UserDefaults.standard.object(forKey: "Host") as! String
        let value = (host=="http://www.tbetios1.com")
        let color = value ? kMainTitleColor : UIColor.black
        let titleColor = value ? UIColor.black : .white
        
        channelBtn1 = UIButton.init(frame: CGRect(x: 20, y: 130, width: (kScreenWidth-80)/2, height: 30))
        channelBtn1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        channelBtn1.backgroundColor = color
        channelBtn1.setTitle("线路1", for: .normal)
        channelBtn1.setTitleColor(titleColor, for: .normal)
        channelBtn1.layer.borderWidth=1;
        channelBtn1.layer.cornerRadius=3;
        channelBtn1.clipsToBounds = true;
        channelBtn1.layer.borderColor=kMainTitleColor.cgColor;
        channelBtn1.addTarget(self, action: #selector(switchNetworkChannel(item:)), for: .touchUpInside)
        
        type1View.addSubview(channelBtn1)
        
        let value2 = (host=="http://www.tbetios2.com")
        let color2 = value2 ? kMainTitleColor : UIColor.black
        let titleColor2 = value2 ? UIColor.black : .white
        
        channelBtn2 = UIButton.init(frame: CGRect(x:channelBtn1.right+40, y: 130, width: (kScreenWidth-80)/2, height: 30))
        channelBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        channelBtn2.backgroundColor = color2
        channelBtn2.setTitle("线路2", for: .normal)
        channelBtn2.setTitleColor(titleColor2, for: .normal)
        channelBtn2.layer.borderWidth=1;
        channelBtn2.layer.cornerRadius=3;
        channelBtn2.clipsToBounds = true;
        channelBtn2.layer.borderColor=kMainTitleColor.cgColor;
        channelBtn2.addTarget(self, action: #selector(switchNetworkChannel(item:)), for: .touchUpInside)
        
        type1View.addSubview(channelBtn2)
    }
    //充值视图
    func initRechargeView(){
        let view = UIView.init(frame: CGRect(x: 0, y: channelBtn1.bottom+20, width:kScreenWidth, height: 40))
        
        let lb = UILabel.init(frame: CGRect(x: 20, y: 10, width:70, height: 20))
        lb.textColor = kMainTitleColor
        lb.text = "账户余额:"
        lb.font = UIFont.systemFont(ofSize: 14)
        
        moneyLB = UILabel.init(frame: CGRect(x: lb.right, y: 10, width:80, height: 20))
        moneyLB.textColor = kMainTitleColor;
        moneyLB.font = UIFont.systemFont(ofSize: 14)
        moneyLB.text = "0.00";
        
        
        let chargeBtn = UIButton.init(frame: CGRect(x: channelBtn2.left,y: 10, width:60, height: 20))
        chargeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        chargeBtn.setTitle("充值", for: .normal)
        chargeBtn.setTitleColor(kMainBgColor, for: .normal)
        chargeBtn.backgroundColor = kMainTitleColor;
        chargeBtn.addTarget(self, action: #selector(chargeAction), for: .touchUpInside)
        
        
        let tiXianBtn = UIButton.init(frame: CGRect(x: channelBtn2.right-60,y: 10, width:60, height: 20))
        tiXianBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        tiXianBtn.setTitle("提现", for: .normal)
        tiXianBtn.setTitleColor(kMainBgColor, for: .normal)
        tiXianBtn.backgroundColor = ColorFromOX(rgbValue: 0x878787);
        tiXianBtn.addTarget(self, action: #selector(chargeAction), for: .touchUpInside)
        
        view.addSubview(lb)
        view.addSubview(moneyLB)
        view.addSubview(chargeBtn)
        view.addSubview(tiXianBtn)
        type1View.addSubview(view)
    }
    
   
    //平台类型视图
    func initType2View(){
        type2View = UIView.init(frame: CGRect(x: 0, y: typeSegment.bottom+10, width:kScreenWidth, height: 220))
        
        let imageArr = ["home_gametype_mg","home_gametype_pt","home_gametype_ttg",
                        "home_gametype_gg","home_gametype_gpi","home_gametype_tgp",
                        "home_gametype_ag","home_gametype_bbin"];
        let titleArr = ["MG平台","PT平台","TTG平台","GG平台","GPI平台",
                        "TGP平台","AG平台","BBIN平台"]
        let space = (kScreenWidth>320) ? (kScreenWidth-300)/3:(kScreenWidth-280)/3
        let offsetX:CGFloat = (kScreenWidth>320) ? 22 : 12
        for i in 0..<titleArr.count {
            let x = offsetX+CGFloat(i%4)*(space+64)
            let y = CGFloat(10+(i/4)*109);
            
            let btn = UIButton.init(frame: CGRect(x: x, y: y, width: 64, height: 64))
            btn.tag = 500+i
            btn.setImage(UIImage.init(named:imageArr[i]), for: .normal)
            btn.addTarget(self, action: #selector(type2BtnAction(item:)), for: .touchUpInside)
            
            let titleLB = UILabel.init(frame: CGRect(x: x, y: btn.bottom+10, width:64, height: 20))
            titleLB.text = titleArr[i]
            titleLB.textAlignment = .center
            titleLB.textColor = UIColor.white
            titleLB.font = UIFont.systemFont(ofSize: 12)
            
            type2View.addSubview(btn)
            type2View.addSubview(titleLB)
        }
    }
    
    
    //MARK:-BtnAction
    
    func type1BtnAction(item:UIButton){
        
    }
    
    func type2BtnAction(item:UIButton){
        
    }
    
    func switchNetworkChannel(item:UIButton){
        if item == channelBtn1 {
            channelBtn1.backgroundColor = kMainTitleColor
            channelBtn1.setTitleColor(.black, for: .normal)
            
            channelBtn2.backgroundColor = kCtrlBGColor
            channelBtn2.setTitleColor(.white, for: .normal)
            
            UserDefaults.standard.set("http://www.tbetios1.com", forKey: "Host")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HaveNetWork"), object: nil)
            
        }else{
            channelBtn2.backgroundColor = kMainTitleColor
            channelBtn2.setTitleColor(.black, for: .normal)
            
            channelBtn1.backgroundColor = kCtrlBGColor
            channelBtn1.setTitleColor(.white, for: .normal)
            
            UserDefaults.standard.set("http://www.tbetios2.com", forKey: "Host")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HaveNetWork"), object: nil)
        }
    }
    
    func segIndexAction(item:UISegmentedControl){
        let index = item.selectedSegmentIndex
        if lastIndex == index{
            return
        }else{
            lastIndex = index
            switch index {
            case 0:
                type2View.removeFromSuperview()
                self.addSubview(type1View)
                break
            case 1:
                type1View.removeFromSuperview()
                self.addSubview(type2View)
                break
            default:
                break
            }
        }
    }
    
    
    func chargeAction(){
        print("recharge")
    }
    
    func tiXianAction(){
        print("tixian")
    }
}
