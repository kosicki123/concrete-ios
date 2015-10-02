//
//  ShotStore.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import Alamofire

protocol ShotDelegate {
    func didFoundShots(shots: [Shot]?);
}

class ShotStore: NSObject {
    static func getShotsFromPage(shotProtocol: ShotDelegate, page: Int)/* ->())*/ {
        request(ShotsRouter.PopularShots(page: page)).responseCollection { (response: Response<[Shot], NSError>) in   
            print(response)
            shotProtocol.didFoundShots(response.result.value)
//            return callback(shots: response.result.value, error: response.result.error)
        }
    }
}
