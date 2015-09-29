//
//  ShotsRouter.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

enum ShotsRouter: URLRequestConvertible {
    
    case PopularShots()
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let (method, path, parameters): (Alamofire.Method, String, [String: AnyObject]?) = {
            var perPage = 20
            switch self {
            case .PopularShots():
                if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                    perPage = 50
                }
                
                return (.GET, "/shots/popular", ["limit": "\(perPage)"])
            }
        }()
        
        let encoding = BaseRouter.getEncodingFor(method)
        return encoding.encode(BaseRouter.getRequestAfterSetup(method, path: path), parameters: parameters).0
    }
}
