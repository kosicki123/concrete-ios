//
//  ShotListViewController.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import UIKit

class ShotListViewController: UIViewController {
    var shotList: [Shot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK:- CollectionViewDataSource

extension ShotListViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shotList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ShotCollectionViewCell
        
        cell.shot = shotList[indexPath.row]
        
        return cell
    }
}

//MARK:- CollectionViewDelegate

extension ShotListViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}