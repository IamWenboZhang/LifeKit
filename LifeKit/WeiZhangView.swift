//
//  WeiZhangView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/3.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeiZhangView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    let WebView = UIWebView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(WebView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
