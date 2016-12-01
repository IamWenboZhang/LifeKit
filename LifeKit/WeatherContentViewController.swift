//
//  WeatherContentViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/15.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeatherContentViewController: UIViewController {

    let contentview = WeatherContentView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        // Do any additional setup after loading the view.
        self.view.addSubview(contentview)
    }
    
//    func setData(weather_now: Now, city: String) {
//        let img = LibByMrOwl.getUIImageByUrl(weather_now.weatherPic)
//        contentview.mainView.setData(city, weather: weather_now.weather, weatherimg: img, tempreature: weather_now.temperature)
//    }

    func setData(weather_future: F1, city:String){
        let img = LibByMrOwl.getUIImageByUrl(weather_future.dayWeatherPic)
        contentview.mainView.setData(city, weather: weather_future.dayWeather, weatherimg: img, tempreature: weather_future.dayAirTemperature)
        contentview.dataView.setData(weather_future)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
