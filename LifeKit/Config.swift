//
//  Config.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class AppInfo:NSObject{
    
    private static var _location:String?
    
    private static var _constellation:String?
    
    static var DEFAULT_LOCATION:String?{
        get{
            let v = LibByMrOwl.getDefault("MyLocation") as? String
            _location = v
            return _location
        }
        set{
            LibByMrOwl.setDefault("MyLocation", value: newValue)
            _location = newValue
        }
    }
    static var DEFAULT_CONSTELLATION:String?{
        get{
            let v = LibByMrOwl.getDefault("MyConstellation") as? String
            _constellation = v
            return _constellation
        }
        set{
            LibByMrOwl.setDefault("MyConstellation", value: newValue)
            _constellation = newValue
        }
    }

    static var appId = "13446"
    static var secret = "f0ceb5f58f9c4c5c92f2df77c2080351"
    static let Font_CODE_LIGHT = "CODE LIGHT"
}



let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height


let btn_height = SCREEN_HEIGHT/5.5
let btn_width = SCREEN_WIDTH/2-15
let weatherview_pointY = SCREEN_HEIGHT - (btn_height * 2) - 65
let starview_pointX = SCREEN_WIDTH/2 + 5

let BOTTOM_BTN_POINTX = CGFloat(10.00)
let BOTTOM_BTN_POINTY = SCREEN_HEIGHT - 60 - btn_height