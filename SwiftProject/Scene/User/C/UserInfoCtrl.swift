//
//  UserInfoCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class UserInfoCtrl: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    private var infoTable:UITableView=UITableView()
    private var dataArr:NSMutableArray = []
    private var contentArr:NSMutableArray = []
    private var head:UIView = UIView()
    private var userIcon:UIImageView = UIImageView()
    private var usernameLB:UILabel = UILabel()
    private var vipLevelLB:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "个人中心"
        self.initTableView()
        self.initHeadView()
        self.initFooterView()
        self.view.bringSubview(toFront: self.loading)
        
        self.handleUserData()
    }
    
    func handleUserData(){
        let model:UserModel = Global.shared.userModel
        contentArr.removeAllObjects()
        let truename = model.true_name.lengthOfBytes(using: String.Encoding.utf8)>1 ? model.true_name : "尚未绑定真实姓名"
        contentArr.add(truename)
        contentArr.add(model.telephone)
        contentArr.add(model.email)
        contentArr.add(truename)
        userIcon.image = UIImage.init(named: Global.levelCodeTurnVipImageNameWithCode(model.level))
        vipLevelLB.text = Global.levelCodeTurnVipNameWithCode(model.level)
        usernameLB.text = model.username
        infoTable.reloadData()
    }
    
    func initTableView(){
        infoTable = UITableView.init(frame: CGRect(x: 0, y:64, width: kScreenWidth, height: kScreenHeight-64), style: UITableViewStyle.plain)
        infoTable.backgroundColor = UIColor.clear
        infoTable.delegate = self
        infoTable.dataSource = self
        self.view.addSubview(infoTable)
    }
    
    
    func initHeadView(){
        head = UIView.init(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: 215))
        infoTable.tableHeaderView = head
        
        let bg = UIView.init(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: 60))
        bg.backgroundColor = .black
        head.addSubview(bg)
        
        userIcon = UIImageView.init(frame:CGRect(x: 12, y: 10, width: 40, height: 40))
        head.addSubview(userIcon)
        
        usernameLB = UILabel.init(frame:CGRect(x: userIcon.right+10, y: 10, width: 150, height: 40))
        usernameLB.textColor = .white
        head.addSubview(usernameLB)
        
        let vipBgImg = UIImageView.init(frame:CGRect(x: kScreenWidth-110, y: 15, width: 110, height: 30))
        vipBgImg.image = UIImage.init(named: "myaccount_bth_vip")
        head.addSubview(vipBgImg)
        
        vipLevelLB = UILabel.init(frame:CGRect(x: 40, y: 0, width: 70, height: 30))
        vipLevelLB.textColor = .white
        vipLevelLB.font = UIFont.systemFont(ofSize: 14)
        vipBgImg.addSubview(vipLevelLB)
        
        self.initMenuItem()
    }
    
    func initMenuItem(){
        let titleArr:NSArray = ["账户清单","VIP尊享","推荐有礼","站内信"]
        let imageArr:NSArray = ["myaccount_icon_accounts","myaccount_icon_vip",
                        "myaccount_icon_friend","myaccount_icon_email"]
        
        let menuView = UIView.init(frame:CGRect(x: 0, y: userIcon.bottom, width: kScreenWidth, height: 100))
        menuView.backgroundColor = .black
        head.addSubview(menuView)
        for i in 0..<titleArr.count {
            let y:CGFloat = 29
            let space:CGFloat = (kScreenWidth-240)/5
            let x:CGFloat = space+CGFloat(i)*(space+60)
            
            let btn = UIButton.init(frame:CGRect(x: x, y: y, width: 60, height: 60))
            btn.tag = 1000+i
            btn.setTitleColor(.white, for: .normal)
            btn.setTitle(titleArr[i] as? String, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets.init(top: 27, left: -22, bottom: 0, right: 0)
            btn.setImage(UIImage.init(named: imageArr[i] as! String), for:.normal)
            btn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 19, bottom:33, right: 19)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.addTarget(self, action: #selector(menuBtnAction(btn:)), for: .touchUpInside)
            menuView.addSubview(btn)
        }
        
        let compeleteInfoBtn = UIButton.init(frame:CGRect(x: 60, y: menuView.bottom+15, width: kScreenWidth-120, height: 30))
        compeleteInfoBtn.setTitleColor(kMainTitleColor, for: .normal)
        compeleteInfoBtn.setTitle("完善个人绑定信息，更多优惠特权", for: .normal)
        compeleteInfoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        compeleteInfoBtn.addTarget(self, action: #selector(menuBtnAction(btn:)), for: .touchUpInside)
        compeleteInfoBtn.layer.borderColor = kMainTitleColor.cgColor
        compeleteInfoBtn.layer.borderWidth = 1
        compeleteInfoBtn.layer.cornerRadius = 3
        head.addSubview(compeleteInfoBtn)

    }
    
    func initFooterView(){
        
    }
    
    //MARK:-RequestData
    func requestUserMoney(){
        RequestAPI.getUserMoneyRequest(successBlock: { (result) in
            
        }) { (msg) in
            
        }
    }
    
    func menuBtnAction(btn:UIButton){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "userinfoCell"
        var cell:WebsiteListCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? WebsiteListCell
        if cell == nil {
            cell = WebsiteListCell.init(style: .default, reuseIdentifier: identifier)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:WebsiteModel = self.dataArr[indexPath.row] as! WebsiteModel
        let ctrl = WebsiteDetailCtrl()
        ctrl.model = model
        self.navigationController?.pushViewController(ctrl, animated: true)
    }
}
