//
//  ShotCollectionViewCell.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ShotCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var thumbnailImageView:UIImageView!
    
    var shot: Shot! {
        didSet {
            titleLabel.text = shot!.title
            thumbnailImageView.sd_setImageWithURL(NSURL(string: shot!.imageUrl!))
        }
    }
}
