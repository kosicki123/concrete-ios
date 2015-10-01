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
    static func getShots(callback: (shots: [Shot]?, error: NSError?) ->()) {
        request(ShotsRouter.PopularShots()).responseCollection { (response: Response<[Shot], NSError>) in
            return callback(shots: response.result.value, error: response.result.error)
        }
    }
}
