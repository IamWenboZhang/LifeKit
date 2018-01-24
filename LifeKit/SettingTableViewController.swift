//
//  SettingTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit


private let SettingcellResueIdentifier = "SettingcellIdentifier"

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: SettingcellResueIdentifier)
        setUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func setUI(){
//        let titleButton = UIButton()
//        titleButton.setTitle("个人设置", forState: .Normal)
//        titleButton.titleLabel?.textColor = UIColor.darkTextColor()
//        self.navigationController!.navigationItem.titleView = titleButton
//        self.navigationController!.navigationItem.backBarButtonItem = UIBarButtonItem()
        self.navigationItem.title = "个人设置"
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
//        if(section == 0){
//            return 2
//        }else if(section == 1){
//            return 2
//        }
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(SettingcellResueIdentifier)
        cell = UITableViewCell(style: .Value1, reuseIdentifier: SettingcellResueIdentifier)
        cell?.accessoryType = .DisclosureIndicator
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "默认地区"
            cell?.detailTextLabel?.text = AppInfo.DEFAULT_LOCATION
            break
        case 1:
            cell?.textLabel?.text = "默认星座"
            cell?.detailTextLabel?.text = AppInfo.DEFAULT_CONSTELLATION
            break
        default:
            break
        }
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == 0){
            UsefulPickerView.showCitiesPicker("省市区选择", defaultSelectedValues: ["北京", "通州"]) {[unowned self] (selectedIndexs, selectedValues) in
                // 处理数据
                let combinedString = selectedValues.reduce("", combine: { (result, value) -> String in
                    result + " " + value
                })
                if selectedIndexs[2] == 0{
                    AppInfo.DEFAULT_LOCATION = selectedValues[1]
                }else{
                    AppInfo.DEFAULT_LOCATION = selectedValues[2]
                }
                self.tableView.reloadData()
            }
    }else if(indexPath.row == 1){
            UsefulPickerView.showSingleColPicker("星座选择", data: constellationArray, defaultSelectedIndex: 5) {[unowned self] (selectedIndex, selectedValue) in
                AppInfo.DEFAULT_CONSTELLATION = selectedValue
                self.tableView.reloadData()
            }
        }
    }
    
    let constellationArray = ["水瓶座","天蝎座","白羊座","金牛座","双子座","双鱼座","处女座","摩羯座","狮子座","射手座","巨蟹座"]
    
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
