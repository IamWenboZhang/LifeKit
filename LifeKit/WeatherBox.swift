//
//  WeatherView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/7.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeatherBox: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var Button = UIButton()
    var leftview = UIView()
    var ImgView_Weather = UIImageView()
    var Label_Weather = UILabel()
    var Label_Temperature = UILabel()
    var Label_Location = UILabel()
    var Label_Wind = UILabel()
    var Label_Air = UILabel()
    var Label_Du = UILabel()
    
    func setWeatherView(weatherinfo:WeatherRootClass?){
        self.subviews.map (
            { $0.removeFromSuperview() }
        )
        let leftview_width = self.bounds.size.width/2.5
        let img_weather_width = leftview_width - 10
        let img_weather_height = img_weather_width
        let label_weather_width = img_weather_width
        let label_weather_height = self.bounds.size.height - 20 - img_weather_height
        
        let label_tempreature_height = (self.bounds.size.height - 15)*0.4
        let label_tempreature_width = label_tempreature_height*1.2
        let label_du_width = label_tempreature_width/2
        let label_du_height = label_du_width
        let label_info_height = (self.bounds.size.height - 24)*0.2
        let label_location_width = label_du_width + label_tempreature_width
        let label_info_width = self.bounds.size.width/3*2-20
        let label_info_pointX = leftview_width + 10
        
        self.Button = UIButton(frame: CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height))
        //self.Button.addTarget(self, action: #selector(WeatherBox.weahterviewClick), forControlEvents: .TouchUpInside)
        self.leftview = UIView(frame: CGRectMake(0,0,leftview_width,self.bounds.size.height))
        self.leftview.backgroundColor = UIColor.whiteColor()
        //self.leftview.alpha = 0.9
        self.ImgView_Weather = UIImageView(frame: CGRectMake(5, 10, img_weather_width, img_weather_height))
        self.ImgView_Weather.contentMode = .ScaleAspectFill
        self.Label_Weather = UILabel(frame: CGRectMake(5,10 + img_weather_height,label_weather_width,label_weather_height))
        self.Label_Weather.textAlignment = .Center
        self.Label_Weather.font = UIFont.systemFontOfSize(10)
        self.Label_Temperature = UILabel(frame: CGRectMake(label_info_pointX,10,label_tempreature_width,label_tempreature_height))
        self.Label_Temperature.textAlignment = .Center
        self.Label_Temperature.font = UIFont.systemFontOfSize(25)
        self.Label_Du = UILabel(frame: CGRectMake(label_info_pointX+label_tempreature_width,8,label_du_width,label_du_height))
        self.Label_Du.textAlignment = .Left
        self.Label_Du.font = UIFont.systemFontOfSize(5)
        self.Label_Location = UILabel(frame: CGRectMake(label_info_pointX,10+label_tempreature_height,label_location_width,label_info_height))
        self.Label_Location.textAlignment = .Left
        self.Label_Location.font = UIFont(name: AppInfo.Font_CODE_LIGHT,size: 10)
        self.Label_Wind = UILabel(frame: CGRectMake(label_info_pointX,10+label_tempreature_height+label_info_height,label_info_width,label_info_height))
        self.Label_Wind.textAlignment = .Left
        self.Label_Wind.font = UIFont(name: AppInfo.Font_CODE_LIGHT,size: 10)
        self.Label_Air = UILabel(frame: CGRectMake(label_info_pointX,10+label_tempreature_height+label_info_height+label_info_height,label_info_width,label_info_height))
        self.Label_Air.font = UIFont(name: AppInfo.Font_CODE_LIGHT,size: 10)
        self.Label_Air.textAlignment = .Left
        if(weatherinfo != nil){
//            var data = NSData(contentsOfURL: NSURL(string: weatherinfo!.showapiResBody.now.weatherPic)!)
//            if(data != nil){
//                self.ImgView_Weather.image = UIImage(data: data!)
//            }
            let img = LibByMrOwl.getUIImageByUrl(weatherinfo!.showapiResBody.now.weatherPic)
            if(img != nil){
                self.ImgView_Weather.image = img
            }
            self.Label_Weather.text = weatherinfo!.showapiResBody.now.weather
            self.Label_Du.text = "○"
            self.Label_Temperature.text = weatherinfo!.showapiResBody.now.temperature
            self.Label_Location.text = weatherinfo!.showapiResBody.cityInfo.c3
            self.Label_Wind.text = weatherinfo!.showapiResBody.now.windDirection + ":" + weatherinfo!.showapiResBody.now.windPower
            if(weatherinfo!.showapiResBody.now.aqiDetail.quality != nil){
                self.Label_Air.text = "空气质量:" + weatherinfo!.showapiResBody.now.aqiDetail.quality
            }
        }
        self.addSubview(Button)
        self.addSubview(leftview)
        self.addSubview(ImgView_Weather)
        self.addSubview(Label_Weather)
        self.addSubview(Label_Temperature)
        self.addSubview(Label_Du)
        self.addSubview(Label_Location)
        self.addSubview(Label_Wind)
        self.addSubview(Label_Air)
        
    }
    
//    func weahterviewClick(){
//        NSLog("weatherview被点击")
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orangeColor()
        self.alpha = 0.9
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
