//
//  SpecialTableViewCell.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/2.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class SpecialTableViewCell: UITableViewCell {


    @IBOutlet weak var CellLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
