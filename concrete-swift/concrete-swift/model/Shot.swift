//
//  Shot.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation

final class Shot: ResponseObjectSerializable, ResponseCollectionSerializable {
    var id: Int
    var title: String
    var description: String
    var likesCount: Int
    var commentsCount: Int
    var imageUrl: String
    var player: Player
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        id = representation.valueForKeyPath("id") as! Int
        title = representation.valueForKeyPath("title") as! String
        description = representation.valueForKeyPath("description") as! String
        likesCount = representation.valueForKeyPath("likes_count") as! Int
        commentsCount = representation.valueForKeyPath("comments_count") as! Int
        imageUrl = representation.valueForKeyPath("image_url") as! String
        player = Player(response:response, representation: representation.valueForKeyPath("player")!)!
    }
    
    class func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> Array<Shot> {
        let shotArray = representation["shots"] as! [AnyObject]
        
        return shotArray.map({
            Shot(response:response, representation: $0)!
        })
    }
}
