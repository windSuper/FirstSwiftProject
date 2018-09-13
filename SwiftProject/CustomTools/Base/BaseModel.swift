//
//  BaseModel.swift
//  SwiftProject
//
//  Created by Ric on 29/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    override init() {
        super.init()
        self.initProps()
    }
    
    init(dic:NSDictionary){
        
        super.init()
        self.initProps()
        self.setValuesForKeys(dic as! [String : Any])
    }
    
    func initProps(){
        var outCount : UInt32 = 0
        
        //获取属性集合
        let property = class_copyPropertyList(type(of:self), &outCount)
        //解包
        
        for i in 0 ..< Int(outCount){
            //取出单个属性
            let property = property?[i]
            
            //获取属性的名字
            guard let char_f = property_getName(property) else{
                continue
            }
            //转换为String
            if let key = String(cString: char_f, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)){
                //添加到数组
                self.setValue("", forKey: key)
            }
            
        }
        free(property)
    }
    
    func checkValue(_ value:Any?)->String{
        if(value==nil){
            return ""
        }else{
            return String(describing: value)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    func setAttributeWithDictionary(dic:NSDictionary){
        
        self.setValuesForKeys(dic as! [String : Any])
    }
}
