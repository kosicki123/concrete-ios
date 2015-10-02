//
//  ShotListViewController.swift
//  concrete-swift
//
//  Created by Renan Kosicki on 9/29/15.
//  Copyright © 2015 Renan Kosicki | K-Mobi. All rights reserved.
//

import UIKit

class ShotListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var shotList: [Shot] = []
    var currentPage = 1
    var cellSize: CGSize = CGSizeMake(300, 300)
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        requestData()
    }
    
    func requestData() {
        ShotStore.getShotsFromPage(self, page: currentPage)
//        ShotStore.getShotsFromPage(index, callback: { (shots, error) -> () in
//            print(error)
//            print(shots)
//        })
    }
    
//    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//
//        if traitCollection.verticalSizeClass == .Regular && traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular {
//            //iPad
//            if (UIDevice.currentDevice().orientation.isLandscape) {
//                cellSize = CGSizeMake(334, 379)
//            } else {
//                cellSize = CGSizeMake(379, 360)
//            }
//        } else if traitCollection.verticalSizeClass == .Compact {
//            //iPhone Landscape
//            cellSize = CGSizeMake(230, 230)
//        } else {
//            cellSize = CGSizeMake(300, 300)
//        }
//        
//        collectionView.reloadItemsAtIndexPaths(collectionView.indexPathsForVisibleItems())
//    }
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

extension ShotListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
    }
    
    
}

//MARK:- ShotDelegate

extension ShotListViewController: ShotDelegate {
    func didFoundShots(shots: [Shot]?) {
        print(shots)
        if let shots = shots {
            shotList = shots
            collectionView.reloadData()
        }
    }
}