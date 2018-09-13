//
//  HistoryGameCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class HistoryGameCtrl: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    private let identifier = "historyGame"
    private var dataArr:NSMutableArray = []
    private var collectView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "最近游戏"
        self.initCollectView()
        self.initData()
        
        self.view.bringSubview(toFront: self.loading);
    }
    
    func initData(){
        
        self.dataArr.removeAllObjects()
        let arr:NSArray = Global.getHistoryGame()
        for i in arr{
            let dic:NSDictionary = i as! NSDictionary
            let model = GameModel.init(dic: dic)
            self.dataArr.add(model)
        }
        self.collectView?.reloadData()

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
    
    
}
