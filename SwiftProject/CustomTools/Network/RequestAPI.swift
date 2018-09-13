
//
//  RequestAPI.swift
//  SwiftProject
//
//  Created by Ric on 6/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class RequestAPI: HttpRequest {

    //MARK:-启动广告图
    class func getADImageRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kADImageUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-应用版本
    class func getAPPVersionRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kAPPVersionUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-登录
    class func loginRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kLoginUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-用户信息
    class func getUserInfoRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kUserInfoUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //MARK:-注册
    class func registerRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kRegisterUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-验证注册账户相关是否可用
    class func isExistAccountRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kExistNameUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func isExistEmailRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kExistEmailUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func isExistPhoneRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kExistPhoneUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-找回密码
    class func findPWDCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kFindPwdCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-找回密码获取验证码
    class func findPWDCheckCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kFindPwdCheckUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func findPWDResetPwdRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kFindPwdCheckUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-修改密码
    class func getUpdatePWDCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kUpdatePwdCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func updatePWDRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kUpdatePwdUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //MARK:-公告
    class func getNoticeData(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kNoticeUrl, params:[:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-验证是否登录
    class func isLoginRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kVertifyLoginUrl, params:[:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //MARK:-注销
    class func logoutRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kLogoutUrl, params:[:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-获取用户账户金额
    class func getUserMoneyRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kUserCashUrl, params:[:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //MARK:-绑定邮箱，手机，真实姓名
    class func bindEmailCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindEmailCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func bindEmailCodeVertifyRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindEmailCheckUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    class func bindPhoneCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindPhoneCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func bindPhoneCodeVertifyRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindPhoneCheckUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    class func bindTrunameRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindTruenameUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //绑定之前步骤选择认证类型
    class func getBindGooglePhoneOrEmailCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindGooglePhoneEmailCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //验证绑定谷歌验证码
    class func bindGoogleVertifyPhoneOrEmailCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindGoogleCheckUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //获取绑定谷歌二维码信息
    class func bindGoogleQRCodeRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindGoogleQRCodeUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //绑定谷歌
    class func bindGoogleRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindGoogleVertifyCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //站内信列表
    class func websiteRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kWebsiteListUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //修改站内信状态
    class func editWebsiteRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kEditWebsiteUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //推荐码获取
    class func tjCodeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kTjCodeUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //推荐用户列表
    class func tjUserListRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kTjUserListUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //26.获取银行列表
    class func getBindListRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBankListUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //27.绑定银行卡
    class func bindCardRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBindBankUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }

    //28.获取用户绑定的银行卡
    class func getUserBindCardListRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kUserBindBankListUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //29.存款优惠活动大Class
    /*首存，笔笔送等等
     */
    
    class func getActiveClassRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kRechargeActiveClassUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //30.获取存款分类活动列表
    class func getSubClassActiveRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kRechargeActiveSubClass, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //31.获取支持手工存款的银行信息
    class func getManualRechargeRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kManualRechargeUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //32.获取银行备注
    class func getBankCodeRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBankCodeUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //33.手工存款生成订单
    class func submitManualRechargeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kManualOrderUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    //34.手工存款完成订单
    class func completeManualRechargeRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kCompeleteOrderUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //35.签到
    class func signUpRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kSignUpUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //是否符合签到大礼包条件
    class func signUpBigSurpriseConditionRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kSignUpBigConditionUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //签到大礼包
    
    class func signBigSurpriseReqeust(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kSignUpBigSupriseUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //36.获取签到列表
    
    class func getSignList(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kSignListUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //37.获取出入款记录
    
    class func getMoneyInAndOutRecord(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kMoneyInOutUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //投注派彩记录
    class func getPaiCaiRecordt(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kPaiCaiUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
   
    
    //38.优惠记录
    
    class func getActiveRecordt(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kPromotionRecordUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //36.额度操作记录
    
    class func getEDURecordt(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kEDURecordUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //获取平台可用金额(不用取消，因为同时发起了多个请求)
    class func getPTMoney(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kPlatEDUUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
   
    
    //手工微信支付方式
    class func getWeixinManualPayType(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kWeChatPayUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //38.获取支付平台信息(不用取消，因为同时发起了3个请求)
    class func getPayTypeInfo(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kThirdPayUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //39.创建第三方支付订单
    class func creatThirdPayOrder(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kThirdPayOrderUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
   
    //40.将资金从第三方平台转入自己系统内
    class func requestBackMoneyToAccount(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kBackMoneyUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //41.提现
    class func withdrawalCashRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kWithdrawalsUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    
    //43.优惠活动类别
    class func requestActiveHeadRequest(successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kYouhuiHeadUrl, params: [:], method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //44.优惠活动列表
    class func requestActiveListRequest(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kYouhuiListUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //45.请求游戏URL
    class func requestGameUrl(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kGameUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
    
    //45.请求游戏列表
    class func requestPlatGameList(paramDic:NSDictionary,successBlock:@escaping (_ result:NSDictionary)->Void,failBlock:@escaping (_ result:String)->Void){
        HttpRequest.request(url:kGamesListUrl, params: paramDic, method: kPost, success: { (result) in
            successBlock(result)
        }) { (msg) in
            failBlock(msg)
        }
    }
    
}
