//
//  PromtionModel.swift
//  SwiftProject
//
//  Created by Ric on 29/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class PromtionModel: BaseModel {

    var class_id:String = ""
    var content:String = ""
    var ext:String = ""
    var end_time:String = ""
    var id:String = ""
    var img1:String = ""
    var img2:String = ""
    var img3:String = ""
    var img4:String = ""
    var is_banner:String = ""
    var is_blank:String = ""
    var is_list:String = ""
    var is_m_banner:String = ""
    var is_m_list:String = ""
    var other:String = ""
    var rule:String = ""
    var sort:String = ""
    var start_time:String = ""
    var status:String = ""
    var sub_class_id:String = ""
    var sub_title:String = ""
    var sys_id:String = ""
    var title:String = ""
    var url:String = ""
    
    override init(dic: NSDictionary){
        super.init(dic: dic)
    }
}
