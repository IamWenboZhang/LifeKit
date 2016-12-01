//
//  CarViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    let weiZhangVC = WeiZhangViewController()
    
    let jinxingVC = TrafficRestrictionTableViewController()
    
    let oilpriceVC = OilPriceTableViewController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let carview = CarView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        carview.weizhangbutton.addTarget(self, action: #selector(CarViewController.weizhangClick), forControlEvents: .TouchUpInside)
        carview.noThoroughfareBtn.addTarget(self, action: #selector(CarViewController.jinxingClick), forControlEvents: .TouchUpInside)
        carview.gasBtn.addTarget(self, action: #selector(CarViewController.oilPriceClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(carview)
    }
    
//    @objc private func weizhangClick()
//    {
//        navigationController?.pushViewController(WeiZhangViewController(), animated: true)
//    }
    
    func oilPriceClick(){
        navigationController?.pushViewController(oilpriceVC, animated: true)
    }
    
    func weizhangClick()
    {
        navigationController?.pushViewController(weiZhangVC, animated: true)
    }
    
    func jinxingClick(){
        navigationController?.pushViewController(jinxingVC, animated: true)
    }
//
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
