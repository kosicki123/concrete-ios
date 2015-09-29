//
//  Shot.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation

final class Shot: ResponseObjectSerializable, ResponseCollectionSerializable {
    var title: String
    var image: String
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        title = representation.valueForKeyPath("title") as! String
        image = representation.valueForKeyPath("images.poster.thumb") as! String
    }
    
    class func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> Array<Shot> {
        let shotArray = representation as! [AnyObject]
        
        return shotArray.map({
            Shot(response:response, representation: $0)!
        })
    }
}
