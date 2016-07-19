//
//  BasicViewController.swift
//  BanannyDemo
//
//  Created by jamespoyu on 2016/7/18.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

class BasicViewController:UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
//    let imageCellIdenterfier = "specialcell"
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhotoPressed(sender: AnyObject) {
        // Declare an action sheet
        let actionSheet = UIAlertController(title: "Select Photo", message: "Select Photo from these source", preferredStyle: .ActionSheet)
        
        // Provide from camera
        // Check if it support camera
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            actionSheet.addAction(UIAlertAction(title: "Open Camera", style: .Default, handler: { (alertAction) in
                self.presentImagePicker(withType: .Camera)
            }))
        }
        
        // Choose from photo library
        // Check if it support photo library
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (alertAction) in
                self.presentImagePicker(withType: .PhotoLibrary)
            }))
        }
        
        // From saved album
        // Check if support photo album
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            actionSheet.addAction(UIAlertAction(title: "Saved album", style: .Default, handler: { (alertAction) in
                self.presentImagePicker(withType: .SavedPhotosAlbum)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
//        self.presentViewController(actionSheet, animated: true, completion: nil)
        
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tableViewList.registerNib(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: imageCellIdenterfier)
        
//        tableViewList.dataSource = self
//        tableViewList.delegate = self
//        tableViewList.reloadData()
        
        self.imageView.contentMode = .ScaleAspectFit
    }
    
    
    func presentImagePicker(withType type:UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        
        // You can allow to edit photo here
        imagePicker.allowsEditing = true
        
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

//    // MARK: - Table view data source
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        
//        
//        return 12
//    }
//
//    
//    
//    
//    
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier(imageCellIdenterfier, forIndexPath: indexPath) as! SpecialTableViewCell
//        
//        
//        cell.CellLabel.text = String(Login.loginNames[indexPath.row].name)
//        
//        
//        
//        return cell
//        
//        
//    }

    
    
    
    
}
