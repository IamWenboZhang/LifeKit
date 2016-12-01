//
//  ConstellationViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/17.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

private let SummaryIdentifier = "ConstellationSummaryReuseIdentifier"
private let LuckReuseIdentifier = "ConstellationLuckReuseIdentifier"
private let GuiRenReuseIdentifier = "ConstellationGuiRenReuseIdentifier"
private let YunShiReuseIdentifier = "ConstellationYunShiReuseIdentifier"
private let TextViewReuseIdentifier = "ConstellationTextViewReuseIdentifier"
class ConstellationViewController: UITableViewController {

    //不隐藏本页面的导航栏
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    var constellation : String?{
        didSet{
            if (constellation?.length > 0){
                LifeHelper.GetConstellationLuck(constellation!, callback: { (constellationdata) in
                    self._constellationData = constellationdata
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    private var _constellationData : ConstellationRootClass?{
        didSet{
            if let constellationInfo = _constellationData {
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 设置下拉刷新控件
        refreshControl = RefreshControl(frame: CGRectZero)
        refreshControl?.addTarget(self, action: #selector(ConstellationViewController.getInfo), forControlEvents: .ValueChanged)
        //refreshControl?.beginRefreshing()
        self.constellation = AppInfo.DEFAULT_CONSTELLATION
        registerCell()
        self.tableView.separatorStyle = .None
        self.tableView.tableFooterView = UIView()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCell(){
        self.tableView.registerClass(ConstellationSummaryTableViewCell.self, forCellReuseIdentifier: SummaryIdentifier)
        self.tableView.registerClass(LuckTableViewCell.self, forCellReuseIdentifier:LuckReuseIdentifier)
        self.tableView.registerClass(GuiRenTableViewCell.self, forCellReuseIdentifier: GuiRenReuseIdentifier)
        self.tableView.registerClass(YunShiTableViewCell.self, forCellReuseIdentifier: YunShiReuseIdentifier)
        self.tableView.registerClass(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewReuseIdentifier)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //实现TableViewDelegte
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var result:CGFloat = 0
        switch indexPath.row {
        case 0:
            result = 220
        case 1:
            result = 70
        case 2:
            result = 70
        case 3:
            result = 70
        case 4:
            result = 90
        case 5:
            result = 90
        case 6:
            result = 90
        case 7:
            result = 100
        case 8:
            result = 70
        default:
            result = 70
        }
        return result
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var summarycell = tableView.dequeueReusableCellWithIdentifier(SummaryIdentifier) as! ConstellationSummaryTableViewCell
        summarycell  = ConstellationSummaryTableViewCell(style: .Default, reuseIdentifier: SummaryIdentifier)
        summarycell.selectionStyle = .None
        var luckcell1 = tableView.dequeueReusableCellWithIdentifier(LuckReuseIdentifier) as! LuckTableViewCell
        luckcell1  = LuckTableViewCell(style: .Default, reuseIdentifier: LuckReuseIdentifier)
        luckcell1.selectionStyle = .None
        
        var luckcell2 = tableView.dequeueReusableCellWithIdentifier(LuckReuseIdentifier) as! LuckTableViewCell
        luckcell2  = LuckTableViewCell(style: .Default, reuseIdentifier: LuckReuseIdentifier)
        luckcell2.selectionStyle = .None
        
        let guirencell = GuiRenTableViewCell(style: .Default, reuseIdentifier: GuiRenReuseIdentifier)
        guirencell.selectionStyle = .None
        
        let aiqingYunshiCell = YunShiTableViewCell(style: .Default, reuseIdentifier: YunShiReuseIdentifier)
        aiqingYunshiCell.selectionStyle = .None
        
        let workYunshiCell = YunShiTableViewCell(style: .Default, reuseIdentifier: YunShiReuseIdentifier)
        workYunshiCell.selectionStyle = .None
        
        let moneyYunshiCell = YunShiTableViewCell(style: .Default, reuseIdentifier: YunShiReuseIdentifier)
        moneyYunshiCell.selectionStyle = .None
        
        let jianpingCell = TextViewTableViewCell(style: .Default, reuseIdentifier: TextViewReuseIdentifier)
        jianpingCell.selectionStyle = .None
        
        let noteCell = TextViewTableViewCell(style: .Default, reuseIdentifier: TextViewReuseIdentifier)
        noteCell.selectionStyle = .None

        var result:UITableViewCell?
        switch indexPath.row{
        case 0:
            //let cell = ConstellationSummaryTableViewCell()
            summarycell.ConstellationInfo = self._constellationData
            result = summarycell
            break
        case 1:
            luckcell1.setTitle("幸运时间:", title2: "幸运颜色:")
            luckcell1.form1.dataView.text = self._constellationData?.showapiResBody.day.luckyTime
            luckcell1.form2.dataView.text = self._constellationData?.showapiResBody.day.luckyColor
            result = luckcell1
            break
        case 2:
            luckcell2.setTitle("幸运方位:", title2: "幸运数字:")
            luckcell2.form1.dataView.text = self._constellationData?.showapiResBody.day.luckyDirection
            luckcell2.form2.dataView.text = self._constellationData?.showapiResBody.day.luckyNum
            result = luckcell2
            break
        case 3:
            let grxz = self._constellationData?.showapiResBody.day.grxz
            if(grxz != nil){
                let guirenpinyin = LifeHelper.WenZiToPinYin_Constellation(grxz!)
                let guirenImg = UIImage(named: guirenpinyin)?.reSizeImage(CGSize(width: 20, height: 20))
                guirencell.setData("贵人星座:", guirenstar: grxz! , guirenImg: guirenImg!)
            }
            result = guirencell
            break
        case 4:
            let img_aiqing = UIImage(named: "car_32px")
            
            if(self._constellationData?.showapiResBody.day.loveTxt != nil){
                let text = (self._constellationData?.showapiResBody.day.loveTxt)!
                aiqingYunshiCell.setData(img_aiqing!, text: text, title: "爱情指数：")
            }
            result = aiqingYunshiCell
            break
        case 5:
            let img_work = UIImage(named: "car_32px")
             if(self._constellationData?.showapiResBody.day.workTxt != nil){
                 let text = (self._constellationData?.showapiResBody.day.workTxt)!
                workYunshiCell.setData(img_work!, text:text, title: "工作指数：")
            }
            result = workYunshiCell
            break
        case 6:
            let img_money = UIImage(named: "car_32px")
            if(self._constellationData?.showapiResBody.day.moneyTxt != nil){
                let text = (self._constellationData?.showapiResBody.day.moneyTxt)!
                moneyYunshiCell.setData(img_money!, text: text, title: "财富指数：")
            }
            result = moneyYunshiCell
            break
        case 7:
            if(self._constellationData?.showapiResBody.day.generalTxt != nil){
                let text = (self._constellationData?.showapiResBody.day.generalTxt)!
                jianpingCell.setData("运势简评:", content: text)
            }
            result = jianpingCell
            break
        case 8:
            if(self._constellationData?.showapiResBody.day.dayNotice != nil){
                let text = (self._constellationData?.showapiResBody.day.dayNotice)!
                noteCell.setData("今日提醒:", content: text)
            }
            result = noteCell
            break
        default:
            result = summarycell
            break
        }
        return result!
    }
    
    
    
    
    func getInfo(){
        LifeHelper.GetConstellationLuck(self.constellation!) { (constellationdata) in
            self._constellationData = constellationdata
            self.tableView.reloadData()
            if self.refreshControl!.refreshing{
                self.refreshControl!.endRefreshing()
            }
        }
    }
}
