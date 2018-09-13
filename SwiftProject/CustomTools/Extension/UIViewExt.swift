//
//  UIViewExt.swift
//  SwiftProject
//
//  Created by Ric on 26/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

extension UIView {
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width=newValue
        }
        
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height=newValue
        }
        
    }
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x=newValue
        }
        
    }
    
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y=newValue
        }
        
    }
    
    var left:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x=newValue
        }
        
    }
    
    
    var top:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y=newValue
        }
        
    }
    
    
    
    var right:CGFloat{
        get{
            return (self.frame.origin.x+self.frame.size.width)
        }
        set{
            self.frame.origin.x=newValue-self.frame.size.width
        }
        
    }
    
    
    var bottom:CGFloat{
        get{
            return (self.frame.origin.y+self.frame.size.height)
        }
        set{
            self.frame.origin.y=newValue-self.frame.size.height
        }
        
    }
    
    func viewController () -> (UIViewController){
        
        //1.通过响应者链关系，取得此视图的下一个响应者
        var next:UIResponder?
        next = self.next!
        repeat {
            //2.判断响应者对象是否是视图控制器类型
            if ((next as? UIViewController) != nil) {
                return (next as! UIViewController)
                
            }else {
                next = next?.next
            }
            
        } while next != nil
        
        return UIViewController()
    }
}
