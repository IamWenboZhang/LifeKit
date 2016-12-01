//
//  HuiLvViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/1.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class HuiLvViewController: UIViewController {

    let calcView = HuiLvCalcView()
    
    let huilvTableView = UITableView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
