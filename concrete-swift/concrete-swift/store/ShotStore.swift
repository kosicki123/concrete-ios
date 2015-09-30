//
//  ShotStore.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

class ShotStore: NSObject {
    static func getShots(callback: (shots: [Shot]?, error: ErrorType?) ->()) {
        request(ShotsRouter.PopularShots()).responseArray { (request: NSURLRequest, HTTPURLResponse: NSHTTPURLResponse?, response: [Shot]?, data: AnyObject?, error: ErrorType?) in
            print(data)
            print(request)
            
            if let error = error {
                return callback(shots: nil, error: error);
            }
            
            return callback(shots: data as! [Shot], error: nil)
        }
    }
}
