//
//  UserAccountList.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class UserAccountList: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "账户清单"
        
        self.view.bringSubview(toFront: self.loading)
        
    }

}
