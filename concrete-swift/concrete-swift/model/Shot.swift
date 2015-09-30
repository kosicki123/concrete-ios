//
//  Shot.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper

class Shot: Mappable {
    var id: Int?
    var title: String?
    var description: String?
    var likesCount: Int?
    var commentsCount: Int?
    var imageUrl: String?
    var player: Player?
    
    required init?(_ map: Map) {
        
//        id = representation.valueForKeyPath("id") as! Int
//        title = representation.valueForKeyPath("title") as! String
//        description = representation.valueForKeyPath("description") as! String
//        likesCount = representation.valueForKeyPath("likes_count") as! Int
//        commentsCount = representation.valueForKeyPath("comments_count") as! Int
//        imageUrl = representation.valueForKeyPath("image_url") as! String
//        player = Player(response:response, representation: representation.valueForKeyPath("player")!)!
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        likesCount <- map["likes_count"]
        commentsCount <- map["comments_count"]
        imageUrl <- map["image_url"]
        player <- map["player"]
    }
}
