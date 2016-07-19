//
//  SegmentControlViewController.swift
//  BanannyTest
//
//  Created by 張智涵 on 2016/7/12.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class SegmentControlViewController: UIViewController {
    @IBOutlet weak var customControl: BetterSegmentedControl!
    @IBOutlet weak var parentsLoginView: UIView!
    @IBOutlet weak var babysitterLoginView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customControl configure
        customControl.titles = ["我是父母", "我是保姆"]
        customControl.addTarget(self, action: #selector(SegmentControlViewController.ControlValueChanged(_:)), forControlEvents: .ValueChanged)
        self.babysitterLoginView.alpha = 0
        self.parentsLoginView.alpha = 1
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - customControl Func
    func ControlValueChanged(sender: BetterSegmentedControl) {
        if sender.index == 0 {
            UIView.animateWithDuration(0.2, animations: {
                self.parentsLoginView.alpha = 1
                self.babysitterLoginView.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.2, animations: {
                self.parentsLoginView.alpha = 0
                self.babysitterLoginView.alpha = 1
            })
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
