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
    
    //Possibility to add more routes
    case PopularShots(page: Int)
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let (method, route, parameters): (Alamofire.Method, String, [String: AnyObject]?) = {
            switch self {
                case .PopularShots(let page):
                return (.GET, Constants.PopularShotsPath.rawValue, ["page": page])
            }
        }()
        
        return BaseRouter.encode(method, route: route, parameters: parameters).0
    }
}