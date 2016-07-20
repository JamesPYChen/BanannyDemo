//
//  PhotoAlbumController.swift
//  BanannyTest
//
//  Created by jamespoyu on 2016/7/13.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Photos

let reuseIdentifier = "PhotoCell"
let albumName = "My App"

class PhotoAlbumController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    @IBOutlet weak var contentLayout: UICollectionViewFlowLayout!
    var albumFound : Bool = false
    var assetCollection: PHAssetCollection! //specific folder in our app
    var photoAsset: PHFetchResult!
    
    //Actions & Outlets
    @IBAction func btnCamera(sender: AnyObject) {
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func btnPhotoAlbum(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
       
       
        
        // Check if the folder exists, if not, create it.
        let fetchOptions = PHFetchOptions()
        
        //search the folder name we have
        fetchOptions.predicate = NSPredicate(format: "title = %@", albumName)
        
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: fetchOptions)
        
        if(collection.firstObject != nil){
            //found the album
            self.albumFound = true
            self.assetCollection = collection.firstObject as! PHAssetCollection
        }else{
            //create the folder
            NSLog("Folder \"%@\" does not exist. Creating now...", albumName)
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                
                // Start we want to do
                let request = PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(albumName)
                
                }, completionHandler: { (success:Bool, error:NSError?) in
                    print("Creation of folder -> %@", success ? "Success" : "Error!")
                    self.albumFound = (success ? true:false)
                    
                    
            
                    
                    
            })
        }

        
    }
    
    override func viewWillAppear(animated: Bool) {
        //fetch the photo with collections
        self.navigationController?.hidesBarsOnTap = false
        self.photoAsset = PHAsset.fetchAssetsInAssetCollection(self.assetCollection, options: nil)
        self.collectionView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "viewLargePhoto"){
            
            let controller: ViewPhoto = segue.destinationViewController as! ViewPhoto
            let indexPath: NSIndexPath = self.collectionView.indexPathForCell(sender as! UICollectionViewCell)!
            controller.Index = indexPath.item
            controller.assetCollection = self.assetCollection
            controller.photoAsset = self.photoAsset
        }
    }
    
    
    //UICollectionViewDataSource methods
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        var count: Int = 0
        if(self.photoAsset != nil){
            count = self.photoAsset.count
        }
        
        
        return count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell: PhotoThumbnail = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoThumbnail
        
        //Modify the Cell
        
        let asset :PHAsset = self.photoAsset[indexPath.item] as! PHAsset
        
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: .AspectFill, options: nil) { (result,
            info) in
            cell.setThumbnailImage(result!)
        }
        
        
        
        cell.backgroundColor = UIColor.redColor()
        
        return cell
        
    }
    
    //UICollectionViewDelegateFlowLayout methods
    
    
    
}
