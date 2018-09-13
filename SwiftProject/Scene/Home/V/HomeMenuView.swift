//
//  HomeMenuView.swift
//  SwiftProject
//
//  Created by Ric on 10/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HomeMenuView: UIView {

    private var titleArr:NSArray = []
    private var imgArr:NSArray = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        titleArr = ["注册／登录","优惠活动","好友推荐","优惠申请",
                  "银行卡","账户清单","图形锁","设置","修改密码","抽奖"];
        imgArr = ["home_menu_login","home_menu_preferential","home_menu_recommended",
                  "home_menu_Preferentialapplication","home_menu_Bankcard",
                  "home_menu_Listaccounts","home_menu_lock","home_menu_setup",
                  "home_menu_Changepassword","home_menu_Luckydraw"];
        let bgView = UIView.init(frame: self.bounds)
        bgView.backgroundColor = UIColor.black
        self.addSubview(bgView)
        
        self.initMenuItem()
    }
    
    func initMenuItem(){
        
        let size:CGFloat = GetScaleWidthPlus(50)
        let lbSize:CGFloat = GetScaleWidthPlus(75)
        let lbOriginX = (GetScaleWidthPlus(50)-GetScaleWidthPlus(75))/2
        let fontSize:CGFloat = GetScaleWidthPlus(14)
        let space = (kScreenWidth-24-size*5)/4
        for i in 0..<imgArr.count {
            let x = 12+(size+space)*CGFloat(i%5)
            let y = 15+(size+35)*CGFloat(i/5)
            
            let menuBtn = UIControl.init(frame: CGRect(x: x, y: y, width: size, height: size))
            menuBtn.tag = 100100+i
            menuBtn.addTarget(self, action: #selector(menuAction(item:)), for: .touchUpInside)
            
            let imgView = UIImageView.init(frame: CGRect(x:0,y:0,width:size,height:size))
            imgView.image = UIImage.init(named: imgArr[i] as! String)
            
            let titleLB = UILabel.init(frame: CGRect(x:lbOriginX,y:imgView.bottom,width:lbSize,height:20))
            titleLB.tag = 100200+i
            titleLB.textAlignment = .center
            titleLB.textColor = UIColor.white
            titleLB.text=titleArr[i] as? String
            titleLB.font = UIFont.systemFont(ofSize: fontSize)
            
            if i==0 && Global.shared.isLogin {
                titleLB.text="个人中心"
            }
            menuBtn.addSubview(imgView)
            menuBtn.addSubview(titleLB)
            self.addSubview(menuBtn)
            
        }
        
    }

    func menuAction(item:UIControl){
        let index:Int = item.tag - 100100
        switch index {
        case 0:
             self.viewController().navigationController?.pushViewController(UserInfoCtrl(), animated: true)
            break
        case 1:
            self.viewController().navigationController?.pushViewController(PromotionCtrl(), animated: true)
            break
        case 2:
             self.viewController().navigationController?.pushViewController(FriendRecommandCtrl(), animated: true)
            break
        case 3:
            self.viewController().navigationController?.pushViewController(PromotionApplyCtrl(), animated: true)
            break
        case 4:
            break
        case 5:
            self.viewController().navigationController?.pushViewController(UserAccountList(), animated: true)
            break
        case 6:
            break
        case 7:
            break
        case 8:
            break
        case 8:
            break
        default:
            break
        }
        
    }
}
