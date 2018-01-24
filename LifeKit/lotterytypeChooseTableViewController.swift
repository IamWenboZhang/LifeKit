//
//  lotterytypeChooseTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/22.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let lotteryTypeReuseIdentifier = "lotteryTypeReuseIdentifier"

class lotterytypeChooseTableViewController: UITableViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    
    private var lotteryTypes:[LotteryTypeResult]?{
        didSet{
            if let result = lotteryTypes{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LotteryHelper.GetLotteryTypeList { (lotterytypelist) in
            self.lotteryTypes = lotterytypelist.showapiResBody.result
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(lotteryTypeTableViewCell.self, forCellReuseIdentifier: lotteryTypeReuseIdentifier)
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(self.lotteryTypes != nil){
            return (self.lotteryTypes?.count)!
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(lotteryTypeReuseIdentifier) as! lotteryTypeTableViewCell
        
        cell = lotteryTypeTableViewCell(style: .Default, reuseIdentifier: lotteryTypeReuseIdentifier)
        if(self.lotteryTypes != nil){
            let item = self.lotteryTypes![indexPath.row]
            cell.setData(item)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let choosevalue = self.lotteryTypes![indexPath.row]
        NSNotificationCenter.defaultCenter().postNotificationName("lotterytype_choose", object: nil, userInfo: ["lotterytype":choosevalue])
        
//        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    deinit {
        // 3、remove notification
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
