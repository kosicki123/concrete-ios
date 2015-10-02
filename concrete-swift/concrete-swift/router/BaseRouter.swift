//
//  BaseRouter.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

class BaseRouter {
    
    static func getRequestAfterSetup(method: Alamofire.Method, route: String) -> NSMutableURLRequest {
        let URL = NSURL(string: Constants.BaseURL.rawValue)!
        let URLRequest  = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(route))
        URLRequest.HTTPMethod = method.rawValue
        
        return URLRequest
    }
    
    static func getEncodingFor(method: Alamofire.Method) ->Alamofire.ParameterEncoding {
        //Possibility to use different encodings to different methods
        switch method {
        default:
            return Alamofire.ParameterEncoding.URL
        }
    }
    
    static func encode(method: Alamofire.Method, route: String, parameters: [String: AnyObject]?) -> (NSMutableURLRequest, NSError?) {
        return getEncodingFor(method).encode(getRequestAfterSetup(method, route: route), parameters: parameters)
    }
}