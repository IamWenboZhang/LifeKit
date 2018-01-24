//
//  HuiLvViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/1.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let HuiLvHQReuseIdentifier = "HuiLvHQReuseIdentifier"

class HuiLvViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var currencys:[HuiLvHQList]?{
        didSet{
            
        }
    }

    let calcView = HuiLvCalcView()
    
    let huilvTableView = UITableView(frame: CGRectInfinite, style: .Grouped)

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    //收起虚拟键盘
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.calcView.fromTextField.resignFirstResponder()
    }
    
    func setUI(){
        self.edgesForExtendedLayout = .None
        self.view.addSubview(calcView)
        self.view.addSubview(huilvTableView)
        
        calcView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        huilvTableView.snp_makeConstraints { (make) in
            make.top.equalTo(calcView.snp_bottom)
            make.left.right.bottom.equalTo(self.view)
        }
        
    }
    
    func setData(){
        LifeHelper.GetHuiLvHQ { (huilvHQdata) in
            var realCurrencys = [HuiLvHQList]()
            var currencyKeyValuePairs = Dictionary<String,String>()
            for(var i = 0 ;i < huilvHQdata.showapiResBody.list.count;i += 1){
                if (huilvHQdata.showapiResBody.list[i].code != nil){
                    realCurrencys.append(huilvHQdata.showapiResBody.list[i])
//                    currencyKeyValuePairs.append([huilvHQdata.showapiResBody.list[i].name :huilvHQdata.showapiResBody.list[i].code])
                    currencyKeyValuePairs[huilvHQdata.showapiResBody.list[i].name] = huilvHQdata.showapiResBody.list[i].code
                }
            }
            self.currencys = realCurrencys
            self.huilvTableView.reloadData()
            self.calcView.setData(currencyKeyValuePairs)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.huilvTableView.delegate = self
        self.huilvTableView.dataSource = self
        self.huilvTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: HuiLvHQReuseIdentifier)
        setUI()
        setData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if(currencys != nil){
            if(currencys?.count > 0){
                return (currencys?.count)!
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(currencys != nil){
            if(currencys?.count > 0){
                if(currencys![section].code != nil){
                    return (currencys![section].code)!
                }
            }
        }
        return nil
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if(currencys != nil){
            if(currencys?.count > 0){
                return currencys![section].day + " " + currencys![section].time
            }
        }
        return nil
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.huilvTableView.dequeueReusableCellWithIdentifier(HuiLvHQReuseIdentifier)
        cell = UITableViewCell(style: .Value2, reuseIdentifier: HuiLvHQReuseIdentifier)
        cell?.selected = false
        if(currencys != nil){
            if(currencys?.count > 0){
                let HQinfo = self.currencys![indexPath.section]
                switch indexPath.row {
                case 0:
                    cell = UITableViewCell(style: .Default, reuseIdentifier: HuiLvHQReuseIdentifier)
                    cell?.textLabel?.text = HQinfo.name
                    break
                case 1:
                    cell?.textLabel?.text = "现汇买入价"
                    cell?.detailTextLabel?.text = HQinfo.huiIn
                    break
                case 2:
                    cell?.textLabel?.text = "现汇卖出价"
                    cell?.detailTextLabel?.text = HQinfo.huiOut
                    break
                case 3:
                    cell?.textLabel?.text = "现钞买入价"
                    cell?.detailTextLabel?.text = HQinfo.chaoIn
                    break
                case 4:
                    cell?.textLabel?.text = "现钞卖出价"
                    cell?.detailTextLabel?.text = HQinfo.chaoOut
                    break
                case 5:
                    cell?.textLabel?.text = "中行折算价"
                    cell?.detailTextLabel?.text = HQinfo.zhesuan
                    break
                default:
                    break
                }
            }
        }
        return cell!
    }
}
