//
//  PhotoThumbnail.swift
//  BanannyTest
//
//  Created by jamespoyu on 2016/7/14.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class PhotoThumbnail: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    func setThumbnailImage(thumbnailImage: UIImage){
        self.imgView.image = thumbnailImage
    }

}
