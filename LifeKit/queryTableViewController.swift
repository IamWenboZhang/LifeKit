//
//  queryTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/22.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit


private let queryLotteryReuseIdentifier = "queryLotteryReuseIdentifier"

private let typeLotteryReuseIdentifier = "typeLotteryReuseIdentifier"

class queryLotteryTableViewController: UITableViewController {

    
    var lotterycode:String?{
        didSet{
            if let code = lotterycode{
                LotteryHelper.GetMutileLotteryList(code, callback: { (mutilelotterydata) in
                    self.lotteryhistory = mutilelotterydata.showapiResBody.result
                })
            }
        }
    }
    
    var lotterytype:LotteryTypeResult?{
        didSet{
            if let type = lotterytype{
                self.lotterycode = type.code
            }
        }
    }
    
    private var lotteryhistory:[LotteryResult]?{
        didSet{
            if let history = lotteryhistory{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        NSNotificationCenter.defaultCenter().addObserverForName("lotterytype_choose", object: nil, queue: NSOperationQueue.mainQueue()) { (info) -> Void in
            print((info.userInfo!["lotterytype"])!)
            self.lotterytype = (info.userInfo!["lotterytype"])! as! LotteryTypeResult
//            self.lotterycode =
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置下拉刷新控件
        refreshControl = RefreshControl(frame: CGRectZero)
        refreshControl?.addTarget(self, action: #selector(queryLotteryTableViewController.getData), forControlEvents: .ValueChanged)
        //设置代理和数据源
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerClass(LotteryTableViewCell.self, forCellReuseIdentifier: queryLotteryReuseIdentifier)
        self.tableView.registerClass(lotteryTypeTableViewCell.self, forCellReuseIdentifier: typeLotteryReuseIdentifier)
        
       
    }
    
    func getData(){
        if(lotterycode != nil){
            LotteryHelper.GetMutileLotteryList(self.lotterycode!, callback: { (mutilelotterydata) in
                self.lotteryhistory = mutilelotterydata.showapiResBody.result
                if self.refreshControl!.refreshing{
                    self.refreshControl!.endRefreshing()
                }
            })
        }
    }

    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
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
        if(section == 0){
            return 1
        }else if(section == 1){
            if(self.lotteryhistory != nil){
                if(self.lotteryhistory?.count > 0)
                {
                    return (self.lotteryhistory?.count)!
                }
            }
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(queryLotteryReuseIdentifier) as! LotteryTableViewCell
        if(indexPath.section == 0)
        {
            let choosecell = lotteryTypeTableViewCell(style: .Default, reuseIdentifier: typeLotteryReuseIdentifier)
            if self.lotterytype == nil{
                choosecell.setData("请选择彩票类型")
            }
            else {
                choosecell.setData(self.lotterytype!)
            }
            
            return choosecell
        }
        else if(indexPath.section == 1){
            if(self.lotteryhistory != nil){
                cell.setData(self.lotteryhistory![indexPath.row])
            }
        }
        return cell
    }

    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0)
        {
            let chooseLotteryVC = lotterytypeChooseTableViewController()
            self.navigationController?.pushViewController(chooseLotteryVC, animated: true)
        }
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
