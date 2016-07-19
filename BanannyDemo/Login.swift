//
//  image.swift
//  第一天swift課
//
//  Created by Kyle on 2016/6/2.
//  Copyright © 2016年 Alphacamp. All rights reserved.
//

import UIKit

class Login {
    static var loginNames = [Login(name:"姓名"),
        Login(name:"暱稱"),Login(name:"電子郵件")]
    
    var name:String
    
    init(name:String){
        self.name = name
    
    }


}
