//
//  WebsiteDetailCtrl.swift
//  SwiftProject
//
//  Created by Ric on 16/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class WebsiteDetailCtrl: BaseViewController,UITableViewDataSource,UITableViewDelegate{
    var model:WebsiteModel=WebsiteModel()
    var infoTable:UITableView=UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "站内信详情"
        self.initSubView()
        
        if model.u_status == "1" {
            self.requestEdit()
        }
    }
    
    func requestEdit() {
        let str = model.u_id+"_2"
        RequestAPI.editWebsiteRequest(paramDic: ["msg_edit":str], successBlock: { (result) in
        }) { (msg) in
            HUD.showText(msg)
        }
    }
    
    func initSubView(){
        infoTable = UITableView.init(frame: CGRect(x: 0, y:64, width: kScreenWidth, height: kScreenHeight-64), style: UITableViewStyle.plain)
        infoTable.backgroundColor = UIColor.clear
        infoTable.delegate = self
        infoTable.dataSource = self
        self.view.addSubview(infoTable)
        self.initTableHeaderView()
    }
    
    func initTableHeaderView(){
        let header = UIView.init(frame:  CGRect(x: 0, y:0, width: kScreenWidth, height:60))

        let titleLB = UILabel.init(frame: CGRect(x: (kScreenWidth-140)/2, y: 20, width:140 , height: 30))
        titleLB.text = model.c_date
        titleLB.textColor=kPlaceHolderColor;
        titleLB.textAlignment=NSTextAlignment.center;
        titleLB.font = UIFont.systemFont(ofSize: 12);
        titleLB.layer.cornerRadius = 3
        titleLB.clipsToBounds = true
        header.addSubview(titleLB);
        
        infoTable.tableHeaderView = header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "DetailWebsite"
        var cell:WebsiteDetailCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? WebsiteDetailCell
        if cell == nil {
            cell = WebsiteDetailCell.init(style: .default, reuseIdentifier: identifier)
        }
        //填充数据
        cell?.titleLB.text = model.title
        cell?.subTitleLB.text = model.content
        cell?.icon.image = UIImage.init(named: "email_logo")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CalculateTextHeight(text:model.content,LBWidth:kScreenWidth-60,fontSize:13)
        return (height>40) ? 60+height : 100;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
