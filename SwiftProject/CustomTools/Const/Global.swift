//
//  Global.swift
//  SwiftProject
//
//  Created by Ric on 17/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class Global: NSObject {
    
    static let shared = Global.init()
    private override init(){}

    
    var isLogin:Bool{
        set{
            UserDefaults.standard.set(newValue, forKey: "isLogin")
        }
        get{
            let value = UserDefaults.standard.object(forKey: "isLogin")
            if value != nil {
                return value as! Bool
            }
            return false
        }
    }
    
    var sessionID:String{
        set{
            UserDefaults.standard.set(newValue, forKey: "sessionID")
        }
        get{
            let value = UserDefaults.standard.object(forKey: "sessionID")
            if value != nil {
                return value as! String
            }
            return ""
        }
    }
    
    var userModel:UserModel{
        set{
            let dic:NSDictionary = ["email":newValue.email,
                       "level":newValue.level,
                       "tj_code":newValue.tj_code,
                       "bind_tel":newValue.bind_tel,
                       "username":newValue.username,
                       "true_name":newValue.true_name,
                       "telephone":newValue.telephone,
                       "bind_mail":newValue.bind_mail,
                       "secret_int":newValue.secret_int,
                       "bind_secret":newValue.bind_secret,]
            
            UserDefaults.standard.set(dic, forKey: "UserModel")
        }
        get{
            let value = UserDefaults.standard.object(forKey: "UserModel")
            if value != nil {
                return UserModel.init(dic: value as! NSDictionary)
            }
            return UserModel()
        }
    }
    
    
    class func saveHistoryGame(model:GameModel){
        let result = UserDefaults.standard.object(forKey: "historyGame")
        var arr:NSMutableArray=[]
        if result != nil {
            arr = NSMutableArray.init(array: result as! [Any], copyItems: true)
        }
        let dic = ["plat_form":model.plat_form,"game_type":model.game_type,
                   "game_name":model.game_name,"game_id":model.game_id,
                   "game_kind":model.game_kind,"game_title":model.game_title,
                   "img_url":model.img_url,]
        if arr.count == 0 {
            arr.add(dic)
        }else{
            var isAdd = false;
            for i in arr {
                let tempDic = i as! NSDictionary
                if tempDic["game_title"] as? String == dic["game_title"]  {
                    isAdd = false
                    break
                }else{
                    isAdd = true
                }
            }
            
            if isAdd {
                arr.insert(dic, at: 0)
            }
        }
        UserDefaults.standard.set(arr, forKey: "historyGame")
    }
    
    class func getHistoryGame()->NSArray{
        
        let arr:NSArray = UserDefaults.standard.object(forKey: "historyGame") as! NSArray
        return arr
    }
    
    class func levelCodeTurnVipImageNameWithCode(_ code:String)->String{
        var imgName:String = "portrait_ordinary"
        switch code {
        case "0":
            imgName = "portrait_ordinary"
            break
        case "2000":
            imgName = "portrait_guest"
            break
        case "2101":
            imgName = "portrait_silver"
            break
        case "2102":
            imgName = "portrait_gold"
            break
        case "2103":
            imgName = "portrait_diamond"
            break
        case "2111":
            imgName = "portrait_elite"
            break
        case "2112":
            imgName = "portrait_star"
            break
        case "2113":
            imgName = "portrait_master"
            break
        default:
            break
        }
        
        return imgName
    }
    
    class func levelCodeTurnVipNameWithCode(_ code:String)->String{
        var imgName:String = "普通会员"
        switch code {
        case "0":
            imgName = "普通会员"
            break
        case "2000":
            imgName = "特邀会员"
            break
        case "2101":
            imgName = "白银会员"
            break
        case "2102":
            imgName = "黄金会员"
            break
        case "2103":
            imgName = "钻石会员"
            break
        case "2111":
            imgName = "精英会员"
            break
        case "2112":
            imgName = "明星会员"
            break
        case "2113":
            imgName = "大师会员"
            break
        default:
            break
        }
        
        return imgName
    }
}
