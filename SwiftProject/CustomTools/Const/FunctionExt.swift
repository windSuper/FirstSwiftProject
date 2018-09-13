//
//  FunctionExt.swift
//  SwiftProject
//
//  Created by Ric on 5/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class FunctionExt: NSObject {
    /**
     *  cell倒计时显示时间
     *
     *  @param seconds 时间参数
     *
     *  @return 返回字符串时间
     */
    class func lessSecondToDay(seconds:Int)->String{
        
        let day:Int = seconds/24/3600
        let hour:Int = (seconds%(24*3600))/3600
        let min:Int = seconds%3600
        let second:Int = seconds%60
        var time:String=""
        if day>0 {
            
            time = "剩余\(day)天"
            
        }else{
            
            if (hour>0) {
                
                time = "剩余\(hour)时\(min)分\(second)秒"
            }else{
                
                if (min>0) {
                    
                    time = "剩余\(min)分\(second)秒"
                }else
                {
                    if (second>0) {
                        
                        time = "剩余\(second)秒";
                    }else{
                        
                        time = "";
                    }
                }
            }
        }

        return time
    }
    
    class func cellHeightCaculateWithModelArr(arr:[[String:Any]],key:String,labelWidth:CGFloat,labelFontSize:CGFloat)->[CGFloat]{
        
        var cellHeightArr:[CGFloat] = []
        
        for dic:[String:Any] in arr {
            
            let text:String = dic[key] as! String
            let textSize = self.caculateTextHeight(text: text, labelWidth: labelWidth, labelFontSize: labelFontSize)
            let height:CGFloat = textSize.height
            cellHeightArr.append(height)
        }
        return cellHeightArr
    }
    
    class func caculateTextHeight(text:String,labelWidth:CGFloat,
                                  labelFontSize:CGFloat)->CGSize{
        let textSize:CGSize = text.boundingRect(with: CGSize(width:labelWidth,height:CGFloat(MAXFLOAT)),options: NSStringDrawingOptions.usesLineFragmentOrigin,attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: labelFontSize)], context: nil).size
        return textSize
        
    }
    
}
