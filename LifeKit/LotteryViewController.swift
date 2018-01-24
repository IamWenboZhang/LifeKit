//
//  LotteryViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LotteryViewController: UIViewController {
    
    let newLotteryVC = newLotteryTableViewController()
    
    let queryLotteryVC = queryLotteryTableViewController()
    
    //    var fucainameArray:[String]! = [String]()
//    var ticainameArray:[String]! = [String]()
    
    let lotteryview = LotteryView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(lotteryview)
        setAction()
        // Do any additional setup after loading the view.
    }
    
    func setAction(){
        self.lotteryview.newBtn.addTarget(self, action: #selector(newBtnClick), forControlEvents: .TouchUpInside)
        self.lotteryview.queryBtn.addTarget(self, action: #selector(queryBtnClick), forControlEvents: .TouchUpInside)
    }
    
    func newBtnClick(){
        self.navigationController?.pushViewController(newLotteryVC, animated: true)
    }
    
    func queryBtnClick(){
        self.navigationController?.pushViewController(queryLotteryVC, animated: true)
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
