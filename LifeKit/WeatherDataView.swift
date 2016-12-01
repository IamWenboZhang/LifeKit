//
//  WeatherDataView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/16.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeatherDataView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setData(weather_future: F1){
        
        let MarginY = CGFloat(10)
        let labelHeight = (self.frame.size.height - (15 * 2))/7
        let labelWidth = SCREEN_WIDTH/2
        
        let label_airpress_promt = UILabel(frame: CGRectMake(0,MarginY,labelWidth,labelHeight))
        let label_winddrection_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight,labelWidth,labelHeight))
        let label_windpower_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight*2,labelWidth,labelHeight))
        let label_sunup_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight*3,labelWidth,labelHeight))
        let label_sundown_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight*4,labelWidth,labelHeight))
        let label_rainchance_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight*5,labelWidth,labelHeight))
        let label_ultravioletrays_promt = UILabel(frame: CGRectMake(0,MarginY+labelHeight*6,labelWidth,labelHeight))
        
        
        label_sunup_promt.textAlignment = .Right
        label_sundown_promt.textAlignment = .Right
        label_airpress_promt.textAlignment = .Right
        label_winddrection_promt.textAlignment = .Right
        label_windpower_promt.textAlignment = .Right
        label_ultravioletrays_promt.textAlignment = .Right
        label_rainchance_promt.textAlignment = .Right
        
        label_sunup_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_sundown_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_airpress_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_winddrection_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_windpower_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_ultravioletrays_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_rainchance_promt.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        
        label_sunup_promt.text = "日出时间：|"
        label_sundown_promt.text = "日落时间：|"
        label_airpress_promt.text = "气压：|"
        label_winddrection_promt.text = "风向：|"
        label_windpower_promt.text = "风力：|"
        label_ultravioletrays_promt.text = "紫外线强度：|"
        label_rainchance_promt.text = "降水概率：|"
        
        
        let label_airpress = UILabel(frame: CGRectMake(labelWidth,MarginY,labelWidth,labelHeight))
        let label_winddrection = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight,labelWidth,labelHeight))
        let label_windpower = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight*2,labelWidth,labelHeight))
        let label_sunup = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight*3,labelWidth,labelHeight))
        let label_sundown = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight*4,labelWidth,labelHeight))
        let label_rainchance = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight*5,labelWidth,labelHeight))
        let label_ultravioletrays = UILabel(frame: CGRectMake(labelWidth,MarginY+labelHeight*6,labelWidth,labelHeight))
        
        
        label_sunup.textAlignment = .Left
        label_sundown.textAlignment = .Left
        label_airpress.textAlignment = .Left
        label_winddrection.textAlignment = .Left
        label_windpower.textAlignment = .Left
        label_ultravioletrays.textAlignment = .Left
        label_rainchance.textAlignment = .Left
        
        label_sunup.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_sundown.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_airpress.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_winddrection.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_windpower.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_ultravioletrays.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        label_rainchance.font = UIFont.init(name: "CODE LIGHT", size: 10.0)
        
        let sunuptime = weather_future.sunBeginEnd.split("|")[0]
        let sundowntime = weather_future.sunBeginEnd.split("|")[1]
        label_sunup.text = "  "+sunuptime
        label_sundown.text = "  "+sundowntime
        label_airpress.text = "  "+weather_future.airPress
        label_winddrection.text = "  "+weather_future.dayWindDirection
        label_windpower.text = "  "+weather_future.dayWindPower
        label_ultravioletrays.text = "  "+weather_future.ziwaixian
        label_rainchance.text = "  "+weather_future.jiangshui
        
        self.addSubview(label_airpress_promt)
        self.addSubview(label_airpress)
        self.addSubview(label_winddrection_promt)
        self.addSubview(label_winddrection)
        self.addSubview(label_windpower_promt)
        self.addSubview(label_windpower)
        self.addSubview(label_sunup_promt)
        self.addSubview(label_sunup)
        self.addSubview(label_sundown_promt)
        self.addSubview(label_sundown)
        self.addSubview(label_rainchance_promt)
        self.addSubview(label_rainchance)
        self.addSubview(label_ultravioletrays_promt)
        self.addSubview(label_ultravioletrays)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
