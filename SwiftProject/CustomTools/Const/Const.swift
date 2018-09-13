//
//  Const.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

//MARK:- 应用常量
let ServiceUrl = "https://chat.livechatvalue.com/chat/chatClient/chatbox.jsp?companyID=387948&configID=47009&jid=6484960942&s=1"

//MARK:- app设备信息

/// 当前app信息
let GetAppInfo = Bundle.main.infoDictionary
/// 当前app版本号
let GetAppCurrentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
/// 获取设备系统号
let GetSystemVersion = UIDevice.current.systemVersion


//MARK:- 常用尺寸

/// 全屏尺寸
let kScreenBounds = UIScreen.main.bounds;

/// 全屏宽度
let kScreenWidth = UIScreen.main.bounds.width;

// 全屏高度
let kScreenHeight = UIScreen.main.bounds.height;

/// 全屏尺寸相对于屏幕比

func GetScaleWidthIphone5(_ size:CGFloat)->CGFloat{
    
    return  size*kScreenWidth/CGFloat(320)
}

func GetScaleWidthPlus(_ size:CGFloat)->CGFloat{
    
    return  size*kScreenWidth/CGFloat(414)
}

//tabbar切换视图控制器高度
let kTabbarHeight:CGFloat = 49.0
// 导航栏高度
let kNavigationHeight:CGFloat = 64.0

//MARK:- 通知Name

let kMainBarChangeNotification:String = "MainBarChange"

let kLoginSuceessNotif:String = "kLoginSuceessNotif"


//MARK:- 颜色

let kMainTitleColor = ColorFromOX(rgbValue: 0xd3a14a);
let kPlaceHolderColor = ColorFromOX(rgbValue: 0x969696);
let kMainBgColor = ColorFromOX(rgbValue: 0x191919);
let kLineColor = ColorFromOX(rgbValue: 0x464646);
let kCtrlBGColor = ColorFromOX(rgbValue: 0x0c0c0c);


func ColorFromRGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


func ColorFromOX(rgbValue:Int)->UIColor{
    
    return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0,
                        green: CGFloat((rgbValue & 0xFF00) >> 8)/255.0,
                        blue: CGFloat(rgbValue & 0xFF)/255.0,
                        alpha: 1.0)
}


func SnapShotTabBarView(view:UIView,frame:CGRect)->UIImage{
    
    let size = view.frame.size;
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale);
    view.drawHierarchy(in: frame, afterScreenUpdates: true);
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image!;
}

//计算文字宽高
func CalculateTextHeight(text:String,LBWidth:CGFloat,fontSize:CGFloat)->CGFloat{
    let font = UIFont.systemFont(ofSize: fontSize)
    let size = CGSize(width: LBWidth, height:CGFloat(MAXFLOAT))
    let result = text.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil)
    return result.height
}

//placeholder

func AttributePlaceHolder(textfield:UITextField,color:UIColor,fontSize:CGFloat,text:String)->NSAttributedString{
    let font = UIFont.systemFont(ofSize: fontSize)
    let style:NSParagraphStyle = textfield.defaultTextAttributes[NSParagraphStyleAttributeName] as! NSParagraphStyle
    
    let attStr = NSAttributedString.init(string: text, attributes: [NSForegroundColorAttributeName:color,NSFontAttributeName:font,NSParagraphStyleAttributeName:style])
    return attStr;

}


//计算文字宽高
func ScrollContentOffset(itemWidth:CGFloat,itemCount:Int,superViewWidth:CGFloat,index:Int)->CGPoint{
    
    var point:CGPoint = CGPoint(x:0,y:0)
    //是否可向左滑动
    let left:Bool = itemWidth*CGFloat(index) > superViewWidth/2 ? true : false
    //是否可向右滑动
    let right:Bool = itemWidth*CGFloat(itemCount-index-1) > superViewWidth/2 ? true : false
    if left&&right {
        point = CGPoint(x: +(itemWidth*CGFloat(index)+itemWidth/2)-superViewWidth/2, y: 0)
    }else{
        if !left && right{
            point = CGPoint(x:0,y:0)
        }else{
            point = CGPoint(x: itemWidth*CGFloat(itemCount)-superViewWidth,y:0)
        }
    }
    return point
}

