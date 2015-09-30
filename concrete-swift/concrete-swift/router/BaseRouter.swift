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
    static func getRequestAfterSetup(method: Alamofire.Method, path: String) -> NSMutableURLRequest {
        let URL = NSURL(string: Constants.BaseURL.rawValue)!
        let URLRequest  = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method.rawValue
        
        return URLRequest
    }
    
    static func getEncodingFor(method: Alamofire.Method) ->Alamofire.ParameterEncoding {
        switch method {
//        case .GET:
//            return Alamofire.ParameterEncoding.URL
        default:
            return Alamofire.ParameterEncoding.JSON
        }
    }
}