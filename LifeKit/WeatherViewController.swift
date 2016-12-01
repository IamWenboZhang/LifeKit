//
//  WeatherViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/15.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController,EMCityChooseDelegate {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    var city : String? {
        didSet{
            if (city != nil){
                LifeHelper.GetWeather(city!, callback: { (weatherdata) in
                    self.weatherInfo = weatherdata
                })
            }
        }
    }
    
    private var cityChooseVC = EMCityChoose()
    
    private var weatherInfo:WeatherRootClass?{
        didSet{
            if let weatherdata = weatherInfo {
                if weatherdata.showapiResBody.retCode == 0{
                // 设置数据
                let weatherview = WeatherView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
                let View2 = WeatherContentViewController()
                View2.setData(weatherdata.showapiResBody.f1, city: weatherdata.showapiResBody.cityInfo.c3)
                let View3 = WeatherContentViewController()
                View3.setData(weatherdata.showapiResBody.f2, city: weatherdata.showapiResBody.cityInfo.c3)
                let View4 = WeatherContentViewController()
                View4.setData(weatherdata.showapiResBody.f3, city: weatherdata.showapiResBody.cityInfo.c3)
                let VCs = [View2,View3,View4]
                let reSize = CGSize(width: 40, height: 40)
                let img2 = LibByMrOwl.getUIImageByUrl(weatherdata.showapiResBody.f1.dayWeatherPic)!.reSizeImage(reSize)
                let img3 = LibByMrOwl.getUIImageByUrl(weatherdata.showapiResBody.f2.dayWeatherPic)!.reSizeImage(reSize)
                let img4 = LibByMrOwl.getUIImageByUrl(weatherdata.showapiResBody.f3.dayWeatherPic)!.reSizeImage(reSize)

                let tuple2 = (img:img2,title:LifeHelper.intToWeekDayStr(weatherdata.showapiResBody.f1.weekday))
                let tuple3 = (img:img3,title:LifeHelper.intToWeekDayStr(weatherdata.showapiResBody.f2.weekday))
                let tuple4 = (img:img4,title:LifeHelper.intToWeekDayStr(weatherdata.showapiResBody.f3.weekday))
                let tuples = [tuple2,tuple3,tuple4]
                weatherview.weatherWindow.initializeWithVCsInstanciatedArrayAndButtonImgAndTitleArray(VCs, buttonImgAndTitleArray: tuples)
                weatherview.weatherWindow.setTopBarBackground(UIColor(red: 244/255, green: 164/255, blue: 96/255, alpha: 1.0))
                weatherview.weatherWindow.setAnimatedBarColor(UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1.0))
                self.view.addSubview(weatherview)
                }
            }
            
    }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.city = AppInfo.DEFAULT_LOCATION
        
        setupUI()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: #selector(WeatherViewController.chooseCity))
    }
    
    func chooseCity(){
        //判断城市选择界面是否正在显示
        if(!cityChooseVC.isShow){
            //初始化城市选择界面
            cityChooseVC = EMCityChoose(pointY: 0, buttonTitleCityName: AppInfo.DEFAULT_LOCATION, hotCity: _hotCityArray, cityType: cityListType(rawValue: 1)!, hideSearchBar: false)
            //设置代理为自己
            cityChooseVC.delegate = self
            //添加到父视图上
            self.view.addSubview(cityChooseVC.view)
        }
        else{
            cityChooseVC.closeView()
        }
       
    }
    
    //热门城市
    let _hotCityArray = ["北京市","广州市","上海市","重庆市","成都市","杭州市","南京市","武汉市","西安市","郑州市","南宁市" ,"长沙市","长春市","太原市"]
    
//        - (void)startDisplay:(EMCityChoose *)aCityChooseViewController {
//    NSLog(@"列表出现了");
//    }
//    
//    - (void)stopDisplay:(EMCityChoose *)aCityChooseViewController {
//    NSLog(@"列表消失了");
//    NSLog(@"选择城市为:%@",[aCityChooseViewController getCityName]);
//    [_showCityListButton setTitle:[aCityChooseViewController getCityName] forState:UIControlStateNormal];
//    }
//    
//    - (void)refreshCurrentCity:(EMCityChoose *)aCityChooseViewController {
//    NSLog(@"刷新位置。");
//    }

    //代理的方法
    func stopDisplay(aCityChooseViewController: EMCityChoose!) {
        self.city = aCityChooseViewController.getCityName()
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
