//
//  ViewPhoto.swift
//  BanannyTest
//
//  Created by jamespoyu on 2016/7/13.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import Photos

class ViewPhoto: UIViewController {
    
    var assetCollection: PHAssetCollection! //specific folder in our app
    var photoAsset: PHFetchResult!
    
    var Index: Int = 0
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func btnTrash(sender: AnyObject) {
        
        print("Trash")
    }
    
    @IBAction func btnExport(sender: AnyObject) {
        
        print("export")
    }
    @IBAction func btnCancel(sender: AnyObject) {
        
        print("Cancel")
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnTap = true
        self.displayPhoto()
    }
    
    func displayPhoto() {
        let imageManager = PHImageManager.defaultManager()
        var ID = imageManager.requestImageForAsset(self.photoAsset[Index] as! PHAsset, targetSize: PHImageManagerMaximumSize , contentMode: .AspectFit, options: nil) { (image:UIImage?, info:[NSObject : AnyObject]?) in
            self.imgView.image = image
            self.imgView.contentMode = .ScaleAspectFit
        }
    }
}


