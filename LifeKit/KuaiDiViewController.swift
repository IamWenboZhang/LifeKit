//
//  KuaiDiViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/29.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let KuaiDiReuseIdentifier = "KuaiDiReuseIdentifier"
class KuaiDiViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate,UITableViewDataSource {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    let searchBar = UISearchBar()
    let TableView = UITableView()
    
    var kuaidiData:KDRootClass?{
        didSet{
            if kuaidiData?.showapiResBody.expTextName != nil && kuaidiData?.showapiResBody.expTextName.length>0{
                LifeHelper.GetKuaiDiCom((kuaidiData?.showapiResBody.expTextName)!) { (comData) in
                    self.kuaidiCom = comData
                }
            }
        }
    }
    
    var kuaidiCom:KDComRootClass?{
        didSet{
            self.TableView.reloadData()
        }
    }

    func setUI(){
        self.edgesForExtendedLayout = .None
        searchBar.placeholder = "输入你的快递单号"
        self.view.addSubview(searchBar)
        self.view.addSubview(TableView)
        
        searchBar.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(50)
        }
        
        TableView.snp_makeConstraints { (make) in
            make.bottom.left.right.equalTo(self.view)
            make.top.equalTo(searchBar.snp_bottom)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.TableView.delegate = self
        self.TableView.dataSource = self
        self.TableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: KuaiDiReuseIdentifier)
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(kuaidiData != nil){
            return kuaidiData!.showapiResBody.data.count + 1
        }
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var result:String?
//        if(kuaidiData != nil){
//            if(kuaidiData?.showapiResBody.comZh != nil){
//                if(kuaidiData?.showapiResBody.comZh.length > 0){
//                    result = (kuaidiData?.showapiResBody.comZh)! + ":" + (kuaidiData?.showapiResBody.nu)!
//                }
//                else{
//                    result = (kuaidiData?.showapiResBody.nu)!
//                }
//            }
//            return result
//        }
        return nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.TableView.dequeueReusableCellWithIdentifier(KuaiDiReuseIdentifier)!
        if(indexPath.row == 0){
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: KuaiDiReuseIdentifier)
            cell.selectionStyle = .None
            if(kuaidiCom?.showapiResBody.flag == true){
                let img = LibByMrOwl.getUIImageByUrl(kuaidiCom!.showapiResBody.expressList[0].imgUrl)
                if img != nil{
                    cell.imageView?.image = img
                }                
                if(kuaidiCom?.showapiResBody.expressList[0].expName != nil && kuaidiCom?.showapiResBody.expressList[0].expName.length > 0){
                    cell.textLabel?.text = kuaidiData?.showapiResBody.expTextName
                }
                cell.detailTextLabel?.text = kuaidiData?.showapiResBody.mailNo
            }
        }
        else{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: KuaiDiReuseIdentifier)
            cell.selectionStyle = .None
            cell.imageView?.image = nil
            let info = kuaidiData?.showapiResBody.data[indexPath.row - 1]
            if(self.kuaidiData != nil){
                cell.textLabel?.text = info?.time
                cell.textLabel?.textAlignment = .Center
                cell.textLabel?.font = UIFont.systemFontOfSize(10)
                cell.detailTextLabel?.text = info?.context
                cell.detailTextLabel?.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
            }
        }
        
        return cell
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        LifeHelper.GetKuaiDi(kuaidino:searchBar.text!) { (kuaididata) in
            self.kuaidiData = kuaididata
        }
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
