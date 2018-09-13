//
//  PromotionCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class PromotionCtrl: BaseViewController,UITableViewDelegate,UITableViewDataSource
{

    private var dataArr:NSMutableArray = []
    private var contentArr:NSMutableArray = []
    private var headTitleArr:NSMutableArray = []
    private var headScroll:UIScrollView = UIScrollView()
    private var infoTable:UITableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "优惠列表"
        self.initSubViews()
        self.requetHeadData()
        self.requestPromotionListData()
        
        self.view.bringSubview(toFront: self.loading)
        
    }
    
    func initSubViews(){
        headScroll = UIScrollView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: 50))
        headScroll.alwaysBounceVertical = false
        self.view.addSubview(headScroll)
        
        infoTable = UITableView.init(frame: CGRect(x: 0, y: headScroll.bottom+10, width: kScreenWidth, height: kScreenHeight-124), style: .plain)
        infoTable.delegate = self
        infoTable.dataSource = self
        infoTable.separatorStyle = .none
        infoTable.backgroundColor = .clear
        self.view.addSubview(infoTable)
    }
    
    func requestPromotionListData(){
        RequestAPI.requestActiveListRequest(paramDic: ["class_id":"","is_banner":"",
                                                        "is_list":"1","is_info":"1",
                                                    "is_m_banner":"","is_m_list":""],
        successBlock: { (result) in
            self.handleListData(result: result)
        }) { (msg) in
            HUD.showText(msg)
        }
    }
    
    func handleListData(result:NSDictionary){
        dataArr.removeAllObjects()
        contentArr.removeAllObjects()
        let arr:NSArray = result["active_list"] as! NSArray
        for dic in arr {
            let tempDic:NSDictionary = dic as! NSDictionary
            let model:PromtionModel = PromtionModel.init(dic: tempDic)
            if model.img3 != "" {
                dataArr.add(model)
            }
        }
        self.contentArr.addObjects(from: dataArr as! [Any])
        infoTable.reloadData()
    }
    
    func requetHeadData(){
        self.loading.isHidden = false
        RequestAPI.requestActiveHeadRequest(successBlock: { (result) in
            self.loading.isHidden = true
            self.handleHeadData(result: result)
        }) { (msg) in
            self.loading.isHidden = true
            HUD.showText(msg)
        }
    }
    
    func handleHeadData(result:NSDictionary){
        headTitleArr.removeAllObjects()
        let dic:NSDictionary = result["class_list"] as! NSDictionary
        let tempAllKeys:NSArray = dic.allKeys as NSArray
        let allkeys = tempAllKeys.sortedArray(comparator: {(objc1, objc2) -> ComparisonResult in
            let ob1:String = objc1 as! String
            let ob2:String = objc2 as! String
            if ob1 > ob2 {
                return ComparisonResult.orderedDescending
            }
            if ob1 < ob2 {
                return ComparisonResult.orderedAscending
            }
            return ComparisonResult.orderedSame
        })
        
        for i in allkeys {
            let tempDic:NSDictionary = dic[i] as! NSDictionary
            let model:PromtionModel = PromtionModel.init(dic: tempDic)
            headTitleArr.add(model)
        }
        
        self.initHeaderScrollItems()
    }
    
    func initHeaderScrollItems(){
        headScroll.contentSize = CGSize(width: 24+100*(headTitleArr.count+1), height: 0)
        let imgArr:NSArray = ["preferential_tab_all","preferential_tab_live",
                              "preferential_tab_sports","preferential_tab_slot",
                              "preferential_tab_lottery","preferential_tab_vip",
                              "preferential_tab_send","preferential_tab_other",
                              "preferential_tab_everyday"]
        let selectedImgArr:NSArray = ["preferential_tab_all_hover",
                                      "preferential_tab_live_hover",
                                      "preferential_tab_sports_hover",
                                      "preferential_tab_slot_hover",
                                      "preferential_tab_lottery_hover",
                                      "preferential_tab_vip_hover",
                                      "preferential_tab_send_hover",
                                      "preferential_tab_other_hover",
                                      "preferential_tab_everyday_hover"];
        for i in 0..<headTitleArr.count+1 {
            let x:CGFloat = CGFloat(12+100*i)
            let titleBtn = UIButton.init(frame: CGRect(x: x, y: 10, width: 84, height: 30))
            titleBtn.tag = 1400+i;
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            titleBtn.setBackgroundImage(UIImage.init(named: imgArr[i] as! String), for: .normal)
            titleBtn.setBackgroundImage(UIImage.init(named: selectedImgArr[i] as! String), for: .selected)
            titleBtn.setTitleColor(.white, for: .normal)
            titleBtn.addTarget(self, action: #selector(headTitleAction(btn:)) , for: .touchUpInside)
            if i==0 {
                titleBtn.isSelected = true
                titleBtn.setTitle("所有优惠", for: .normal)
            }else{
                let model:PromtionModel = self.headTitleArr[i-1] as! PromtionModel
                titleBtn.setTitle(model.title, for: .normal)
            }
            headScroll.addSubview(titleBtn)
        }
        self.infoTable.reloadData()
    }
    
    func headTitleAction(btn:UIButton){
        headScroll.setContentOffset(ScrollContentOffset(itemWidth: 100, itemCount: headTitleArr.count+1, superViewWidth: kScreenWidth, index: btn.tag-1400), animated: true)
        self.contentArr.removeAllObjects()
        for tempBtn in self.headScroll.subviews {
            if tempBtn.isKind(of: UIButton.classForCoder()){
                let button:UIButton = tempBtn as! UIButton
                button.isSelected = false
            }
        }
        btn.isSelected = true
        if btn.tag-1400 == 0 {
            self.contentArr.addObjects(from: dataArr as! [Any])
        }else{
            let model:PromtionModel = headTitleArr[btn.tag-1400-1] as! PromtionModel
            for listData in self.dataArr {
                let listModel:PromtionModel = listData as! PromtionModel
                if listModel.class_id == model.id {
                    self.contentArr.add(listModel)
                }
            }
        }
        self.infoTable.reloadData()
    }
    
    //MARK:-UITableViewDelegate UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "promtionList"
        var cell:PromtionListCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? PromtionListCell
        if cell == nil {
            cell = PromtionListCell.init(style: .default, reuseIdentifier: identifier)
        }
        //填充内容
        let model:PromtionModel = self.contentArr[indexPath.row] as! PromtionModel
        cell?.titleLB.text = model.title
        let subTitle = model.sub_title == "" ? model.title : model.sub_title
        cell?.subTitleLB.text = subTitle
        cell?.imgView.kf.setImage(with: URL.init(string: model.img3))
        
        if indexPath.row == 0 {
            cell?.icon.image = UIImage.init(named: "preferential_newlabel")
        }else if indexPath.row == 1 || indexPath.row == 2{
            cell?.icon.image = UIImage.init(named: "preferential_hotlabel")
        }else{
            cell?.icon.image = UIImage.init(named: "preferential_hotlabel")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model:PromtionModel = contentArr[indexPath.row] as! PromtionModel
        let ctrl:DetailPromtionCtrl = DetailPromtionCtrl()
        ctrl.htmlStr = model.content
        ctrl.actID = model.id
        ctrl.url = model.url
        ctrl.titleStr = model.title
        self.navigationController?.pushViewController(ctrl, animated: true)
    }
    
    
}
