//
//  SearchViewController.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController,UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate{

    private let identifier = "searchGame"
    private var dataArr:NSMutableArray = []
    private var searchTF:UITextField = UITextField()
    private var collectView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.removeFromSuperview()
        self.initNavView()
        self.initCollectView()
        
        self.view.bringSubview(toFront: self.loading);
    }
    
    func requestGame(keyword:String){
        self.loading.isHidden = false
        RequestAPI.requestPlatGameList(paramDic: ["playtype":"mobile","gametitle":keyword], successBlock: { (result) in
            self.loading.isHidden = true
            self.dataArr.removeAllObjects()
            let arr:NSArray = result["data"] as! NSArray
            for i in arr{
                let dic:NSDictionary = i as! NSDictionary
                let model = GameModel.init(dic: dic)
                self.dataArr.add(model)
            }
            self.collectView?.reloadData()
        }) { (msg) in
            self.loading.isHidden = true
            HUD.showText(msg)
        }
    }
    
    func initCollectView(){
        let space = (kScreenWidth-240)/5
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 60, height: 120)
        layout.minimumInteritemSpacing = space
        layout.sectionInset = UIEdgeInsets(top: 0, left: space, bottom: 0, right: space)
        
        collectView = UICollectionView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64), collectionViewLayout: layout)
        collectView?.delegate = self
        collectView?.dataSource=self
        collectView?.backgroundColor = .clear
        collectView?.register(GameCell.classForCoder(), forCellWithReuseIdentifier: identifier)
        self.view.addSubview(collectView!)
    }

    func initNavView(){
        let nav = UIView.init(frame: CGRect(x:0,y:0,width:kScreenWidth,height:64))
        nav.backgroundColor = .black
        
        let borderView = UIView.init(frame: CGRect(x:12,y:27,width:kScreenWidth-74,height:30))
        borderView.layer.borderWidth = 1;
        borderView.layer.cornerRadius = 10;
        borderView.layer.borderColor = kMainTitleColor.cgColor;
        nav.addSubview(borderView)
        
        let bgImg = UIImageView.init(frame:CGRect(x:20, y:34, width:17, height:17))
        bgImg.image = UIImage.init(named:"home_nav_icon_search")
        nav.addSubview(bgImg)
        
        searchTF = UITextField.init(frame:CGRect(x:44,y:27,width:kScreenWidth-110,height:30))
        searchTF.borderStyle = .none
        searchTF.textColor = .white
        searchTF.font = UIFont.systemFont(ofSize: 14)
        searchTF.delegate = self;
        searchTF.clearButtonMode = .whileEditing;
        searchTF.attributedPlaceholder = AttributePlaceHolder(textfield: searchTF, color: kMainTitleColor, fontSize: 12, text: "热门搜索：船长的宝藏")
        searchTF.returnKeyType = .search;//变为搜索按钮
        nav.addSubview(searchTF)
        
        let cancelBtn = UIButton.init(frame:CGRect(x:kScreenWidth-52, y:27, width:40, height:30))
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(kMainTitleColor, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        cancelBtn.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        nav.addSubview(cancelBtn)
        
        self.view.addSubview(nav)
    }
    
    func popAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:-CollectDelegate DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GameCell = collectView!.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GameCell
        cell.model = self.dataArr[indexPath.row] as! GameModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.loading.isHidden = false
        collectionView.allowsSelection = false

        let model:GameModel = self.dataArr[indexPath.row] as! GameModel
        let dic = ["plat":model.plat_form,"gametype":model.game_type,
                   "gamename":model.game_name,"gameid":model.game_id,
                   "gamekind":model.game_kind,]
        RequestAPI.requestGameUrl(paramDic: dic as NSDictionary, successBlock: { (result) in
            self.loading.isHidden = true
            collectionView.allowsSelection = true
            Global.saveHistoryGame(model: model)
            let ctrl:PlayGameCtrl = PlayGameCtrl()
            ctrl.url = result["login_url"] as! String
            let nav:BaseNavigationCtrl = BaseNavigationCtrl.init(rootViewController:ctrl)
            self.present(nav, animated: true, completion: nil)
        }) { (msg) in
            self.loading.isHidden = true
            collectionView.allowsSelection = true
            HUD.showText(msg)
        }
        
    }
    
    
    //MARK:-TextfieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchTF.becomeFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.resignFirstResponder()
        if textField.text != nil {
            self.requestGame(keyword: textField.text!)
        }else{
            HUD.showText("请输入您要搜索的游戏名")
        }
        return true
    }
    
}
