//
//  PoemViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/15.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let poemcellreuseidentifier = "PoemCellRegueIdentifier"

class PoemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let conditionChooseView = PoemConditionChooseView()
    
    let resultTableView = UITableView()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    //收起虚拟键盘
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.conditionChooseView.textfield_key.resignFirstResponder()
    }

    
    var poemdata:PoemRootClass?{
        didSet{
            if let data = poemdata{
                self.resultTableView.reloadData()
            }
        }
    }
    
    func setUI(){
        
        self.edgesForExtendedLayout = .None
        
        conditionChooseView.btn_search.addTarget(self, action: #selector(PoemViewController.searchClick), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(conditionChooseView)
        self.view.addSubview(resultTableView)
        
        conditionChooseView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(180)
        }
        resultTableView.snp_makeConstraints { (make) in
            make.top.equalTo(conditionChooseView.snp_bottom)
            make.left.right.bottom.equalTo(self.view)
        }

    }
    
    
    func searchClick(){
        var num = ""
        let type = conditionChooseView.segement_type.selectedSegmentIndex+1
        let yayuntype = conditionChooseView.segement_yayuntype.selectedSegmentIndex+1
        
        switch conditionChooseView.segement_5or7.selectedSegmentIndex {
        case 0:
            num = "5"
            break
        case 1:
            num = "7"
            break
        default:
            num = "5"
        }
        if conditionChooseView.textfield_key.text?.length>0{
            let keystr = conditionChooseView.textfield_key.text
            QueryHelper.GetPoemList(num, type: type, yayuntype: yayuntype, key: keystr!) { (PoemData) in
                self.poemdata = PoemData
            }
        }
        else{
            let alertView = UIAlertView(title: nil, message: "关键词不能为空！", delegate: self, cancelButtonTitle: "确定")
            alertView.show()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.registerClass(PoemTableViewCell.self, forCellReuseIdentifier: poemcellreuseidentifier)
        setUI()
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.estimatedRowHeight = 120
        resultTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = PoemTableViewCell(style: .Default, reuseIdentifier: poemcellreuseidentifier)
        if self.poemdata != nil{
            if self.poemdata?.showapiResBody.list != nil {
                cell.settext((self.poemdata?.showapiResBody.list[indexPath.row])!)
            }
            
        }
        return cell
    }
    
    
//    //估计高度
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 200
//    }
//    
//    //自动决定真实高度
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return
//    }
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 100
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.poemdata != nil{
            return (self.poemdata?.showapiResBody.list.count)!
        }
        return 0
    }
    
}
