//
//  LifeViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LifeViewController: UIViewController{

    let lifeview = LifeView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    let weatherVC = WeatherViewController()
    
    let constellationVC = ConstellationViewController()
    
    let kuaidiVC = KuaiDiViewController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        if AppInfo.DEFAULT_LOCATION != nil{
            LifeHelper.GetWeather(AppInfo.DEFAULT_LOCATION!) { (weatherdata) in
                self.lifeview.weatherbox.setWeatherView(weatherdata)
                self.lifeview.weatherbox.Button.addTarget(self, action: #selector(LifeViewController.weatherClick), forControlEvents: .TouchUpInside)
            }
        }
        
        if AppInfo.DEFAULT_CONSTELLATION != nil{
            LifeHelper.GetConstellationLuck(AppInfo.DEFAULT_CONSTELLATION!) { (constellationdata) in
                self.lifeview.constellationbox.setConstellationView(constellationdata)
                self.lifeview.constellationbox.Button.addTarget(self, action: #selector(LifeViewController.constellationClick), forControlEvents: .TouchUpInside)
            }

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.lifeview.wuliubutton.addTarget(self, action:  #selector(LifeViewController.kuaidiClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(lifeview)
    }
    
    func weatherClick(){
        navigationController?.pushViewController(weatherVC, animated: true)
    }
    
    func constellationClick(){
        navigationController?.pushViewController(constellationVC, animated: true)
    }
    
    func kuaidiClick(){
        navigationController?.pushViewController(kuaidiVC,animated: true)
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
