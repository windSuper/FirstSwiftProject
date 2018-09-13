
//
//  HttpRequest.swift
//  SwiftProject
//
//  Created by Ric on 21/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpRequest: NSObject {

    typealias success = (_ result:NSDictionary)->Void;
    
    typealias failure = (_ msg:String)->Void;
    
    class func request(url:String,params:NSDictionary,method:String,success: @escaping success,failure: @escaping failure){
        
        let fullUrl = (url.contains("http")==true) ? url : BASE_URL+url
        
        let httpMethod:HTTPMethod = (method=="post"||method=="POST") ? .post : .get;
        let requestParams:Parameters? = params as? Parameters;
        
        Alamofire.request(fullUrl, method: httpMethod, parameters: requestParams).responseJSON{response in
            
            switch response.result {
            case .success:
                
                let result:NSDictionary = response.result.value as! NSDictionary;
                let status:Int = result["Status"] as! Int;
                if(status==200){
                    success(result["Data"] as! NSDictionary);
                }else{
                    failure(result["Msg"] as! String);
                }
            case .failure:

                failure("网络连接错误，请检查网络是否正确");
            }
   
        }
        
    }
}
