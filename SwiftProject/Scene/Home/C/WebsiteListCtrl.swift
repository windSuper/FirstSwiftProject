//
//  WebsiteListCtrl.swift
//  SwiftProject
//
//  Created by Ric on 13/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit


class WebsiteListCtrl: BaseViewController,UITableViewDataSource,UITableViewDelegate{

    var infoTable:UITableView=UITableView()
    var dataArr:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "站内信"
        self.initSubView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reuestData()
    }
    
    func initSubView(){
        infoTable = UITableView.init(frame: CGRect(x: 0, y:64, width: kScreenWidth, height: kScreenHeight-64), style: UITableViewStyle.plain)
        infoTable.backgroundColor = UIColor.clear
        infoTable.delegate = self
        infoTable.dataSource = self
        self.view.addSubview(infoTable)
    }
    
    
    func reuestData(){
        RequestAPI.websiteRequest(paramDic: ["page":"1","rows":"20","status":""], successBlock: { (result) in

            self.dataArr.removeAllObjects()
            let arr = result["msg_list"] as! NSArray
            if arr.count==0 {
                let nodataView = NoDataView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64))
                self.view.addSubview(nodataView)
            }else{
                for i in arr {
                    let model = WebsiteModel.init(dic: i as! NSDictionary)
                    self.dataArr.add(model)
                }
                self.infoTable.reloadData()
            }
        }) { (msg) in
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "websiteList"
        var cell:WebsiteListCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? WebsiteListCell
        if cell == nil {
            cell = WebsiteListCell.init(style: .default, reuseIdentifier: identifier)
        }
        //填充内容
        let model:WebsiteModel = self.dataArr[indexPath.row] as! WebsiteModel
        cell?.titleLB.text = model.title
        cell?.dateLB.text = model.c_date.substring(from: model.c_date.startIndex)
        cell?.icon.image = UIImage.init(named: "email_icon\(indexPath.row%4+1)")
        
        if (model.u_status == "1") {

            cell?.unreadIcon.image = UIImage.init(named:"email_unread")
        }else{

            cell?.unreadIcon.image = UIImage.init(named:"")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let model:WebsiteModel = self.dataArr[indexPath.row] as! WebsiteModel
        let str = model.u_id+"_3"
        RequestAPI.editWebsiteRequest(paramDic: ["msg_edit":str], successBlock: { (result) in
            self.reuestData()
            HUD.showNoticeWithText(.success, text: "删除成功", autoClear: true, autoClearTime: 1)

        }) { (msg) in
            HUD.showText(msg)
        }
    }
}
