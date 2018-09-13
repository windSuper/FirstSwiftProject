//
//  PlayGameCtrl.swift
//  SwiftProject
//
//  Created by Ric on 17/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit
import WebKit

class PlayGameCtrl: BaseViewController,WKNavigationDelegate,WKUIDelegate {

    var webView:WKWebView?
    var plat:String = ""
    var url:String = ""
    var back:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBar.removeFromSuperview()
        self.initWebView();
        self.initNav();
        
        self.view.bringSubview(toFront: self.loading);
        self.loading.isHidden=false;
    }
    
    
    func initNav(){
        back = UIButton.init(frame: CGRect(x: 10, y:self.view.height-50, width: 60, height: 30))
        back.setTitle("返回", for: .normal)
        back.setTitleColor(kMainTitleColor, for: .normal)
        back.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        back.backgroundColor = ColorFromRGBA(r: 0, g: 0, b: 0, a: 0.6)
        back.setImage(UIImage.init(named: "nav_back_icon"), for: .normal)
        back.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        self.view.addSubview(back)
    }
    
    func initWebView(){
        webView = WKWebView.init(frame: CGRect(x: 0, y:0, width:kScreenHeight , height: kScreenWidth));
        webView?.navigationDelegate = self
        webView?.uiDelegate = self
        webView?.scrollView.bounces = false;
        webView?.allowsBackForwardNavigationGestures = true;
        webView?.backgroundColor = UIColor.clear;
        let tempUrl = URL.init(string: self.url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        if tempUrl != nil {
            webView?.load(URLRequest.init(url: tempUrl!));
        }
        self.view.addSubview(webView!);
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        webView?.frame = CGRect(x:0, y:0, width:size.width, height:size.height);
        self.loading.center = webView!.center
        if (size.height<420) {
            
            back.frame = CGRect(x:10, y:size.height-50, width:60, height:30);
        }else{
            back.frame = CGRect(x:10, y:25, width:60, height:30);
        }
    }
    
    func popAction(){
        if (self.navigationController?.viewControllers.count)!>1{
            self.navigationController?.popViewController(animated: true)
        }else{
            self.dismiss(animated:true, completion: nil)
        }
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loading.isHidden=false;
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error){
        self.loading.isHidden=true;
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loading.isHidden=true;
    }

}
