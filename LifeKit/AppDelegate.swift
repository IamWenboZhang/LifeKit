//
//  AppDelegate.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        let tabbarController = UITabBarController()
        
        let lotteryController = UINavigationController(rootViewController: LotteryViewController())
        let trainController = UINavigationController(rootViewController: TrainViewController())
        let carController = UINavigationController(rootViewController: CarViewController())
        let lifeController = UINavigationController(rootViewController: LifeViewController())
        tabbarController.viewControllers = [lifeController,carController,trainController,lotteryController]
        
        let tabbarItem1 = UITabBarItem(title: "生活", image: UIImage(named: "life"), tag: 0)
        let tabbarItem2 = UITabBarItem(title: "汽车", image: UIImage(named: "car"), tag: 0)
        tabbarItem2.image?.imageWithRenderingMode(UIImageRenderingMode.Automatic)
        let tabbarItem3 = UITabBarItem(title: "彩票", image: UIImage(named: "lottery"), tag: 0)
        let tabbarItem4 = UITabBarItem(title: "火车", image: UIImage(named: "train"), tag: 0)
        
        
        
        lotteryController.tabBarItem = tabbarItem3
        trainController.tabBarItem = tabbarItem4
        lifeController.tabBarItem = tabbarItem1
        carController.tabBarItem = tabbarItem2
        
        //设置各页面导航栏透明
//        lifeController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        lifeController.navigationBar.shadowImage = UIImage()
//        lifeController.navigationBar.translucent = true
//        
//        carController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        carController.navigationBar.shadowImage = UIImage()
//        carController.navigationBar.translucent = true
//        
//        trainController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        trainController.navigationBar.shadowImage = UIImage()
//        trainController.navigationBar.translucent = true
//        
//        lotteryController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        lotteryController.navigationBar.shadowImage = UIImage()
//        lotteryController.navigationBar.translucent = true
        
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

