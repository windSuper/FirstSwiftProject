//
//  ServiceViewController.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit
import WebKit

class ServiceViewController: BaseViewController,WKNavigationDelegate,WKUIDelegate {

    var webView:WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNav();
        
        self.initWebView();
        
        self.view.bringSubview(toFront: self.loading);
        self.loading.isHidden=false;
    }
    
    
    func initNav(){
        let navView = NavView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64));
        navView.titleLB.text = "在线客服";
        self.view.addSubview(navView);
    }
    
    func initWebView(){
        self.webView = WKWebView.init(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64-49));
        self.webView?.navigationDelegate = self as WKNavigationDelegate;
        self.webView?.uiDelegate = self as WKUIDelegate;
        self.webView?.scrollView.bounces = false;
        self.webView?.allowsBackForwardNavigationGestures = true;
        self.webView?.backgroundColor = UIColor.clear;
        self.webView?.load(URLRequest.init(url: URL.init(string:ServiceUrl)!));

        self.view.addSubview(self.webView!);
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
