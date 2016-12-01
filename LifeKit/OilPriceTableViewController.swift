//
//  OilPriceTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/28.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let  OilPriceReuseIdentifier = "OilPriceReuseIdentifier"

class OilPriceTableViewController: UITableViewController {

    var oilPriceList : [OilPriceList]?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: OilPriceReuseIdentifier)
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if(oilPriceList != nil){
            return (oilPriceList?.count)!
        }
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func getData(){
        CarHelper.GetOilPriceList { (oilpricelist) in
            self.oilPriceList = oilpricelist.showapiResBody.list
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if(self.oilPriceList != nil){
            return oilPriceList![section].prov
        }
        return nil
    }

    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        let ProvNames:[String]? = {
            var provs:[String]?
            if self.oilPriceList != nil{
                 provs = self.oilPriceList!.map(
                    { $0.prov })
            }
            return provs
        }()
        return ProvNames
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier(OilPriceReuseIdentifier, forIndexPath: indexPath)
        var cell = tableView.dequeueReusableCellWithIdentifier(OilPriceReuseIdentifier)!
        cell = UITableViewCell(style: .Value1, reuseIdentifier: OilPriceReuseIdentifier)
        cell.selectionStyle = .None
        cell.imageView?.image = nil
        let oilPrice = oilPriceList![indexPath.section]
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "p90"
            cell.detailTextLabel?.text = oilPrice.p90
            NSLog(oilPrice.p90)
            break
        case 1:
            cell.textLabel?.text = "p0"
            cell.detailTextLabel?.text = oilPrice.p0
            break
        case 2:
            cell.textLabel?.text = "p97"
            cell.detailTextLabel?.text = oilPrice.p97
            break
        case 3:
            cell.textLabel?.text = "p93"
            cell.detailTextLabel?.text = oilPrice.p93
            break
        default:
            break
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
