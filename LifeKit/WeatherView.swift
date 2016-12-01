//
//  WeatherView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/15.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeatherView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    let weatherWindow = SwiftPages()
    override init(frame: CGRect) {
        super.init(frame: frame)
        weatherWindow.frame = frame
        self.addSubview(weatherWindow)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
