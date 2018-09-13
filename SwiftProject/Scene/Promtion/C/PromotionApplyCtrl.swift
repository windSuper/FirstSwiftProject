//
//  PromotionApplyCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class PromotionApplyCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSubviews()
    }

    func initSubviews(){
        
        let imgBtn:IconRowBtn = IconRowBtn.init(frame: CGRect(x: 0, y:80, width: kScreenWidth, height: 40))
        imgBtn.titleLB.text = "优惠申请"
        imgBtn.indicator.isHidden = true
        imgBtn.icon.image = UIImage.init(named: "pay_icon_Preferentialapplication_firstdeposit")
        self.view.addSubview(imgBtn)
        
        let menu:DropMenuView = DropMenuView.init(frame: CGRect(x: kScreenWidth-130, y: 90, width: 100, height: 20), titleArr: ["联系客服"], rowHeight: 30)
        self.view.addSubview(menu)
        
        let btn:SubmitBtn = SubmitBtn.init(frame: CGRect(x: 20, y: imgBtn.bottom+60, width: kScreenWidth-40, height: 30))
        btn.title = "联系客服"
        btn.addTarget(self, action: #selector(connectService), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func connectService(){
        self.navigationController?.popToRootViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name(kMainBarChangeNotification), object: 2)
    }
}
