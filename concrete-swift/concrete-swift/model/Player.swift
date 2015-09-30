//
//  Player.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/30/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class Player: Mappable {
    var id: Int?
    var name: String?
    var avatarUrl: String?
    
    required init?(_ map: Map) {
//        id = representation.valueForKeyPath("id") as! Int
//        name = representation.valueForKeyPath("name") as! String
//        avatarUrl = representation.valueForKeyPath("avatar_url") as! String
    }
    
    func mapping(map: Map) {
        id <- map["id"] 
        name <- map["name"]
        avatarUrl <- map["avatar_url"]
    }
}
