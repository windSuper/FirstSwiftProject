//
//  FriendRecommandCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class FriendRecommandCtrl: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "好友推荐"
        
        self.view.bringSubview(toFront: self.loading)
        
    }

}
