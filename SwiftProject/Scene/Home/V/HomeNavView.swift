//
//  HomeNavView.swift
//  SwiftProject
//
//  Created by Ric on 9/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HomeNavView: UIView {

    var messageNumLB:UILabel = UILabel()
    
    private var leftBtn:UIButton = UIButton()
    private var searchBtn:UIButton = UIButton()
    private var rightBtn:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.initLeftBtn()
        self.initSearchView()
        self.initRightBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initLeftBtn(){
        leftBtn = UIButton.init(frame:CGRect(x:13,y:23,width:27,height:37))
        leftBtn.setImage(UIImage.init(named: "home_nav_icon_mail"), for: .normal)
        leftBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom:15, right: 0)
        leftBtn.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        
        messageNumLB = UILabel.init(frame: CGRect(x:19,y:-8,width:16,height:16))
        messageNumLB.isHidden = true
        messageNumLB.clipsToBounds = true
        messageNumLB.layer.cornerRadius = 8
        messageNumLB.textAlignment = .center
        messageNumLB.textColor = UIColor.white
        messageNumLB.backgroundColor = UIColor.red
        messageNumLB.font = UIFont.systemFont(ofSize: 10)
        leftBtn.addSubview(messageNumLB)
        
        let titleLB = UILabel.init(frame: CGRect(x:-3,y:22,width:33,height:15))
        titleLB.text="站内信"
        titleLB.textAlignment = .center
        titleLB.font = UIFont.systemFont(ofSize: 10)
        titleLB.textColor = kMainTitleColor
        leftBtn.addSubview(titleLB)
        self.addSubview(leftBtn)
    }
    
    func initSearchView(){
        
        searchBtn = UIButton.init(frame:CGRect(x:leftBtn.right+10,y:25,width:kScreenWidth-100,height:27))
        searchBtn.layer.borderWidth=1
        searchBtn.layer.cornerRadius = 10;
        searchBtn.layer.borderColor = kMainTitleColor.cgColor
        searchBtn.setImage(UIImage.init(named: "home_nav_icon_search"), for: .normal)
        searchBtn.imageEdgeInsets = UIEdgeInsets.init(top: 5, left: 5, bottom:5, right: kScreenWidth-122)
        searchBtn.addTarget(self, action: #selector(searchBtnAction), for: .touchUpInside)
        
        let titleLB = UILabel.init(frame: CGRect(x:25,y:0,width:kScreenWidth-125,height:27))
        titleLB.text=" | 热门搜索：船长的宝藏"
        titleLB.font = UIFont.systemFont(ofSize: 10)
        titleLB.textColor = kMainTitleColor
        searchBtn.addSubview(titleLB)
        self.addSubview(searchBtn)
    }
    
    func initRightBtn(){
     
        rightBtn = UIButton.init(frame:CGRect(x:kScreenWidth-40,y:23,width:27,height:37))
        rightBtn.setImage(UIImage.init(named: "home_nav_icon_pasttime"), for: .normal)
        rightBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom:15, right: 0)
        rightBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
        
        let titleLB = UILabel.init(frame: CGRect(x:-7,y:22,width:41,height:15))
        titleLB.text="最近游戏"
        titleLB.textAlignment = .center
        titleLB.font = UIFont.systemFont(ofSize: 10)
        titleLB.textColor = kMainTitleColor
        rightBtn.addSubview(titleLB)
        self.addSubview(rightBtn)
    }
    
    
    func leftBtnAction(){
        self.viewController().navigationController?.pushViewController(WebsiteListCtrl(), animated: true)
        
    }
    
    func searchBtnAction(){
         self.viewController().navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    func rightBtnAction(){
         self.viewController().navigationController?.pushViewController(HistoryGameCtrl(), animated: true)
    }
}
