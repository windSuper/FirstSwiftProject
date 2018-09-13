//
//  BaseNavigationCtrl.swift
//  SwiftProject
//
//  Created by Ric on 19/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class BaseNavigationCtrl: UINavigationController{
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if(self.viewControllers.count>1){
            return true;
        }else{
            return false;
        }
    }
    
    override var shouldAutorotate: Bool{
        
        if self.topViewController!.isKind(of: PlayGameCtrl.classForCoder()) || self.topViewController!.isKind(of: PortraitGameCtrl.classForCoder()){
            return true
        }
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if self.topViewController!.isKind(of: PlayGameCtrl.classForCoder()){
            return .landscape
        }else if self.topViewController!.isKind(of: PortraitGameCtrl.classForCoder()) {
            return .all
        }
        return .portrait
        
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        if self.topViewController!.isKind(of: PlayGameCtrl.classForCoder()){
            return .landscapeRight
        }
        return .portrait
    }
    
}
