//
//  Player.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/30/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation

final class Player: ResponseObjectSerializable {
    var id: Int
    var name: String
    var avatarUrl: String
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        id = representation.valueForKeyPath("id") as! Int
        name = representation.valueForKeyPath("name") as! String
        avatarUrl = representation.valueForKeyPath("avatar_url") as! String
    }
}
