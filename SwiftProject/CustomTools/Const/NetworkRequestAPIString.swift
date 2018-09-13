//
//  NetworkRequestAPIString.swift
//  SwiftProject
//
//  Created by Ric on 6/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit


//MARK:- NetworkRequest Keyword
let kPost = "POST"

let BASE_URL = "http://www.tbetios1.com"
//let BASE_URL = "http://192.168.2.211:8089"

//MARK:- API

//启动广告
let kADImageUrl = "/active/active_show.do"

//启动广告
let kAPPVersionUrl = "/public/version_censor.do"

//登录
let kLoginUrl = "/public/login.do"

//注册
let kRegisterUrl = "/public/register.do"

//账户是否可用
let kExistNameUrl = "/public/is_exist_name.do"

//邮箱是否可用
let kExistEmailUrl = "/public/is_exist_email.do"

//手机是否可用
let kExistPhoneUrl = "/public/is_exist_phone.do"

//找回密码1获取验证码
let kFindPwdCodeUrl = "/public/forget_pwd_code.do"

//找回密码2验证验证码
let kFindPwdCheckUrl = "/public/forget_pwd_chk.do"

//找回密码3重置密码
let kFindResetPwdUrl = "/public/forget_pwd_update.do"

//修改密码1获取验证码
let kUpdatePwdCodeUrl = "/public/update_pwd_code.do"

//修改密码2重置密码
let kUpdatePwdUrl = "/public/update_pwd_update.do"

//公告
let kNoticeUrl = "/public/notice.do"

//验证是否登录
let kVertifyLoginUrl = "/public/get_data.do"

//用户注销
let kLogoutUrl = "/public/logout.do"

//绑定邮箱获取验证码
let kBindEmailCodeUrl = "/public/email.do"

//绑定邮箱验证
let kBindEmailCheckUrl = "/public/email_verify.do"

//绑定手机获取验证码
let kBindPhoneCodeUrl = "/public/phone.do"

//绑定手机验证
let kBindPhoneCheckUrl = "/public/phone_verify.do"

//绑定真实姓名
let kBindTruenameUrl = "/public/real_name.do"

//1绑定谷歌获取手机或邮箱验证码
let kBindGooglePhoneEmailCodeUrl = "/public/send_code.do"

//2绑定谷歌之验证手机或邮箱验证码
let kBindGoogleCheckUrl = "/public/check_code.do"

//3绑定谷歌获取一个二维码图片
let kBindGoogleQRCodeUrl = "/user/google.do"

//4验证谷歌验证码
let kBindGoogleVertifyCodeUrl = "/public/bind_google_code.do"




//获取用户信息
let kUserInfoUrl = "/user/info.do"

//获取用户余额
let kUserCashUrl = "/user/show_cash.do"

//图片上传
let kUploadUrl = "/cms/upload_pic.do"

//获取站内信列表
let kWebsiteListUrl = "/cms/msg_user_list.do"

//修改站内信
let kEditWebsiteUrl = "/cms/msg_user_edit.do"

//获取推荐码
let kTjCodeUrl = "/ext/tj_code.do"

//获取我推荐的人
let kTjUserListUrl = "/ext/tj_user.do"

//获取银行列表
let kBankListUrl = "/cash/bank_list.do"

//绑定银行卡
let kBindBankUrl = "/cash/bank_add.do"

//获取用户绑定的银行卡
let kUserBindBankListUrl = "/cash/user_bank_list.do"

//存款优惠活动大Class
/*首存，笔笔送等等
 */
let kRechargeActiveClassUrl = "/cash/user_active_class.do"

//获取存款分类活动列表
let kRechargeActiveSubClass = "/cash/user_active.do"

//获取支持手工存款的银行信息
let kManualRechargeUrl = "/cash/bank_manual_list.do"

//获取银行备注
let kBankCodeUrl = "/cash/sgck_code.do"

//手工存款生成订单
let kManualOrderUrl = "/cash/bank_manual.do"

//手工存款完成订单
let kCompeleteOrderUrl = "/cash/bank_order_update.do"

//签到
let kSignUpUrl = "/ext/user_sign.do"

//是否符合签到大礼包条件
let kSignUpBigConditionUrl = "/ext/show_gift.do"

//是否符合签到大礼包条件
let kSignUpBigSupriseUrl = "/ext/sign_gift.do"

//获取签到列表
let kSignListUrl = "/ext/show_user_sign.do"

//获取出入款记录
let kMoneyInOutUrl = "/ext/in_and_out_record.do"

//投注派彩记录
let kPaiCaiUrl = "/game/bet_log.do"

//优惠记录
let kPromotionRecordUrl = "/ext/active_record.do"

//额度操作记录
let kEDURecordUrl = "/game/t_log.do"

//获取平台可用金额(不用取消，因为同时发起了多个请求)
let kPlatEDUUrl = "/public/credit.do"

//手工微信支付方式
let kWeChatPayUrl = "/cash/wechat_manual_list.do"

//获取支付平台信息(不用取消，因为同时发起了3个请求)
let kThirdPayUrl = "/cash/thridpay_list.do"

//创建第三方支付订单
let kThirdPayOrderUrl = "/cash/thridpay_cash.do"

//将资金从第三方平台转入自己系统内
let kBackMoneyUrl = "/cash/withdrawals_before.do"

//提现
let kWithdrawalsUrl = "/cash/withdrawals.do"

//优惠活动类别
let kYouhuiHeadUrl = "/public/active_head.do"

//优惠活动列表
let kYouhuiListUrl = "/public/active_list.do"

//请求游戏URL
let kGameUrl = "/game/login.do"

//请求游戏列表
let kGamesListUrl = "/game/get_list.do"




