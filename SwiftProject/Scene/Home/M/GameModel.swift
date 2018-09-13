//
//  GameModel.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class GameModel: BaseModel {
    
    var ext = ""
    var game_code = ""
    var game_id = ""
    var game_kind = ""
    var game_name = ""
    var game_title = ""
    var game_type = ""
    var hot_status = ""
    var id = ""
    var img_url = ""
    var plat_form = ""
    var plat_type = ""
    var sort = ""
    var status = ""
    
    override init() {
        super.init()
    }
    
    override init(dic: NSDictionary){
        super.init(dic: dic)
    }
}
