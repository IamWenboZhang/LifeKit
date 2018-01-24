//
//  TrafficRestrictionTableViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/25.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let TrafficRestritionReugesIdentifier = "TrafficRestritionReugesIdentifier"
class TrafficRestrictionTableViewController: UITableViewController,EMCityChooseDelegate {

    
    var city:String?{
        didSet{
            if let str = city{
                CarHelper.GetTrafficRestrictionInfo(str, callback: { (TrafficRestrictionInfo) in
                    if(TrafficRestrictionInfo.showapiResBody.retCode == "0"){
                        self.trafficRestrictionArray = TrafficRestrictionInfo.showapiResBody.data
                        self.tableView.reloadData()
                    }
                    else{
                        let alert = UIAlertView(title: nil, message:TrafficRestrictionInfo.showapiResBody.msg , delegate: self, cancelButtonTitle: "确定")
                        alert.show()
                    }
                })
            }
        }
    }
    
    private let hotCityArray = ["北京市","广州市","上海市","重庆市","成都市","杭州市","南京市","武汉市","西安市","郑州市","南宁市" ,"长沙市","长春市","太原市"]
    
    private var cityChooseVC = EMCityChoose()
    
    private var trafficRestrictionArray:[TrafficRestrictionData]?
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .Bottom
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: #selector(TrafficRestrictionTableViewController.setCity))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 500
        // 设置下拉刷新控件
        refreshControl = RefreshControl(frame: CGRectZero)
        refreshControl?.addTarget(self, action: #selector(TrafficRestrictionTableViewController.getData), forControlEvents: .ValueChanged)

        self.city = "北京"
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
        if trafficRestrictionArray == nil{
            return 0
        }
        return (trafficRestrictionArray?.count)!
    }
    
    func getData(){
        CarHelper.GetTrafficRestrictionInfo(self.city!) { (TrafficRestrictionInfo) in
            self.trafficRestrictionArray = TrafficRestrictionInfo.showapiResBody.data
            self.tableView.reloadData()
            if self.refreshControl!.refreshing{
                self.refreshControl!.endRefreshing()
            }
        }
    }
    
    func setCity(){
        if(!cityChooseVC.isShow){
            //初始化城市选择界面
            cityChooseVC = EMCityChoose(pointY: 0, buttonTitleCityName: AppInfo.DEFAULT_LOCATION, hotCity: hotCityArray, cityType: cityListType(rawValue: 1)!, hideSearchBar: false)
            //设置代理为自己
            cityChooseVC.delegate = self
            //添加到父视图上
            self.view.addSubview(cityChooseVC.view)
        }
        else{
            cityChooseVC.closeView()
        }
    }

//    func setCity(){
//        // 注意设置默认值得时候, 必须设置完整, 不能进行省略 ["四川", "成都", "成华区"] 比如不能设置为["四川", "成都"]
//        // ["北京", "通州"] 不能设置为["北京"]
//        UsefulPickerView.showCitiesPicker("省市区选择", defaultSelectedValues: ["北京", "通州"]) {[unowned self] (selectedIndexs, selectedValues) in
//            // 处理数据
//            let combinedString = selectedValues.reduce("", combine: { (result, value) -> String in
//                result + " " + value
//            })
//            if selectedIndexs[2] == 0{
//                self.city = selectedValues[1]
//            }else{
//                self.city = selectedValues[2]
//            }
//        }
//    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier(TrafficRestritionReugesIdentifier, forIndexPath: indexPath) as? TrafficRestrictionTableViewCell
//        let cell  = TrafficRestrictionTableViewCell(style: .Default, reuseIdentifier: TrafficRestritionReugesIdentifier)
//        var cell = self.tableView.dequeueReusableCellWithIdentifier(TrafficRestritionReugesIdentifier) as? TrafficRestrictionTableViewCell
        let cell  = TrafficRestrictionTableViewCell(style: .Default, reuseIdentifier: TrafficRestritionReugesIdentifier)
        var i = 0
        while(i<self.trafficRestrictionArray?.count){
            cell.setData(self.trafficRestrictionArray![i])
            i = i + 1
        }
        
        cell.selectionStyle = .None
        
        // Configure the cell...

        return cell
    }
    
    func stopDisplay(aCityChooseViewController: EMCityChoose!) {
        self.city = aCityChooseViewController.getCityName()
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
