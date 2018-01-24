//
//  newLotteryTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/21.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit


private let lotteryReuseIdentifier = "lotteryReuseIdentifier"

class newLotteryTableViewController: UITableViewController {

    var fucainameArray:[String]! = [String]()
    var ticainameArray:[String]! = [String]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    var lotterytype:[LotteryTypeResult]?{
        didSet{
            if let typeArray = lotterytype{
                for var item in typeArray{
                    if item.issuer == "体彩"{
                        //LotteryViewController.ticainameArray.append(item.descr)
                        self.ticainameArray.append(item.code)
                    }
                    if item.issuer == "福彩"{
                        //LotteryViewController.fucainameArray.append(item.descr)
                        self.fucainameArray.append(item.code)
                    }
                }
            }
            getData()
        }
    }

    
    var newLotteryArray:[LotteryResult]?{
        didSet{
            if let array = newLotteryArray{
                for var item in array{
                    let isContainticai = self.ticainameArray.contains(item.code)
                    if (isContainticai){
                        ticaiArray.append(item)
                    }
                    let isContainfucai = self.fucainameArray.contains(item.code)
                    if (isContainfucai){
                        fucaiArray.append(item)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
    var fucaiArray:[LotteryResult]! = [LotteryResult]()
    
    var ticaiArray:[LotteryResult]! = [LotteryResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 50
        self.tableView.registerClass(LotteryTableViewCell.self, forCellReuseIdentifier: lotteryReuseIdentifier)
        // 设置下拉刷新控件
        refreshControl = RefreshControl(frame: CGRectZero)
        refreshControl?.addTarget(self, action: #selector(newLotteryTableViewController.getData), forControlEvents: .ValueChanged)
        //设置代理和数据源
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        LotteryHelper.GetLotteryTypeList { (lotterytypelist) in
            self.lotterytype = lotterytypelist.showapiResBody.result
        }
    }
    
    func getData(){
       LotteryHelper.GetNewestLotteryList { (newstlotterydata) in
        self.newLotteryArray = newstlotterydata.showapiResBody.result
        if self.refreshControl!.refreshing{
            self.refreshControl!.endRefreshing()
        }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if fucaiArray != nil && section == 0{
            return (fucaiArray?.count)!
        }
        if ticaiArray != nil && section == 1{
            return (ticaiArray?.count)!
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "福彩"
        }
        else if section == 1 {
            return "体彩"
        }
        return nil
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = LotteryTableViewCell(style: .Default, reuseIdentifier: lotteryReuseIdentifier)
        
        switch indexPath.section {
        case 0:
            cell.setData(fucaiArray![indexPath.row])
        case 1:
            cell.setData(ticaiArray![indexPath.row])
        default: break
        }
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
