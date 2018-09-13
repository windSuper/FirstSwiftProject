//
//  UserModel.swift
//  SwiftProject
//
//  Created by Ric on 20/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class UserModel: BaseModel {
    var active_time = ""
    var agent_id = ""
    var bind_mail = ""//绑定邮箱 1代表绑定的
    var bind_secret = ""//绑定谷歌
    var bind_tel = ""//绑定手机
    var birthday = ""
    var cash_num = ""
    var email = ""
    var first_cash_time = ""
    var last_cash_time = ""
    var level = ""
    var login_time = ""
    var qq = ""
    var reg_time = ""
    var secret_char = ""
    var secret_int = ""
    var status = ""
    var telephone = ""
    var tj_code = ""
    var tj_user = ""
    var total_bet_payout = ""
    var total_bet_vaild_amount = ""
    var total_bouns = ""
    var total_cash_in = ""
    var total_cash_out = ""
    var true_name = ""
    var username  = ""

    
    override init() {
        super.init()
    }
    
    override init(dic: NSDictionary){
        super.init(dic: dic)
    }

}
