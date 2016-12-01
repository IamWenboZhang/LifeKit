//
//  MainWeatherView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/16.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class MainWeatherView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var Label_City = UILabel()
    
    var Label_Weather = UILabel()
    
    var ImgView_Weather = UIImageView()
    
    var Label_Tempreature = UILabel()
    
    var Label_Centigrade = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let unitHeight = (frame.size.height-10)/8
        let imgHeight = unitHeight*3
        
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        Label_City = UILabel(frame:CGRectMake(0,5,SCREEN_WIDTH,unitHeight*2))
        Label_City.textAlignment = .Center
        Label_City.font = UIFont.systemFontOfSize(25)
        Label_Weather = UILabel(frame: CGRectMake(0,Label_City.frame.height+5,SCREEN_WIDTH,unitHeight))
        Label_Weather.textAlignment = .Center
        Label_Weather.font = UIFont.init(name: "CODE LIGHT", size: 12.5)
        ImgView_Weather = UIImageView(frame: CGRectMake((SCREEN_WIDTH-imgHeight)/2, Label_City.frame.height+Label_Weather.frame.height+5, imgHeight, imgHeight))
        Label_Tempreature = UILabel(frame: CGRectMake((SCREEN_WIDTH-imgHeight)/2,Label_City.frame.height+Label_Weather.frame.height+ImgView_Weather.frame.size.height+5, 3*unitHeight, 2*unitHeight))
        Label_Tempreature.textAlignment = .Center
        Label_Tempreature.font = UIFont.systemFontOfSize(20)

        
        
        
        self.addSubview(Label_City)
        self.addSubview(Label_Weather)
        self.addSubview(ImgView_Weather)
        self.addSubview(Label_Tempreature)
        self.addSubview(Label_Centigrade)
    }
    
    func setData(city: String, weather: String,weatherimg: UIImage?,tempreature: String) {
        self.Label_City.text = city
        self.Label_Weather.text = weather
        if(weatherimg != nil)
        {
            self.ImgView_Weather.image = weatherimg
        }
        self.Label_Tempreature.text = tempreature + "℃"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
