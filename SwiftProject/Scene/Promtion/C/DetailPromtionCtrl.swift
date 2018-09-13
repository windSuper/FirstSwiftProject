//
//  DetailPromtionCtrl.swift
//  SwiftProject
//
//  Created by Ric on 11/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class DetailPromtionCtrl: BaseViewController,UIWebViewDelegate{

    var webView:UIWebView = UIWebView()
    var htmlStr:String = ""
    var actID:String = ""
    var url:String = ""
    var titleStr:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.titleLB.text = "活动详情"
        self.initWebView()
        self.view.bringSubview(toFront: self.loading);
        self.loading.isHidden = false

    }
    func initWebView(){
        webView = UIWebView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64))
        webView.delegate = self
        self.view.addSubview(webView)
        
        let host:String = UserDefaults.standard.object(forKey: "Host") as! String
        var hostStr = host + "/ios_activeDom.shtml"
        if url.contains("http") {
            hostStr = url
        }
        if Global.shared.isLogin {
            let sessionID = Global.shared.sessionID
            let urlStr:String = hostStr + "?sessionid=\(sessionID)&"+"account=\(Global.shared.userModel.username)&"+"class_id=\(actID)"
            webView.loadRequest(URLRequest.init(url: URL.init(string: urlStr)!))
        }else{
            
            webView.loadHTMLString(htmlStr, baseURL: nil)
        }
        
        self.view.addSubview(webView);
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let urlStr:String = String(describing: request.url)
        if self.titleStr == "天天签到，日日返利" && !urlStr.contains("ios_activeDom") {
            NotificationCenter.default.post(name: Notification.Name( kMainBarChangeNotification), object:1)
            self.navigationController?.popToRootViewController(animated: true)
            
            return false
        }
        return true
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.loading.isHidden = true
        UserDefaults.standard.set(0, forKey: "WebKitCacheModelPreferenceKey")
        UserDefaults.standard.set(false, forKey: "WebKitDiskImageCacheEnabled")
        UserDefaults.standard.set(false, forKey: "WebKitOfflineWebApplicationCacheEnabled")
        UserDefaults.standard.synchronize()
    }
}
