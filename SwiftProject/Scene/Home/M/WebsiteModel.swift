//
//  WebsiteModel.swift
//  SwiftProject
//
//  Created by Ric on 12/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class WebsiteModel: BaseModel {
    var c_date = ""
    var config = ""
    var content = ""
    var ext = ""
    var form_user = ""
    var id = ""
    var s_date = ""
    var hot_status = ""
    var status = ""
    var title = ""
    var to_user = ""
    var type = ""
    var sort = ""
    var u_id = ""
    var u_status = ""
    var user_id = ""
    
    override init() {
        super.init()
    }
    
    override init(dic: NSDictionary){
        super.init(dic: dic)
    }
}
