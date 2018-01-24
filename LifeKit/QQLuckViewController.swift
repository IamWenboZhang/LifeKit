//
//  QQLuckViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/6.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class QQLuckViewController: UIViewController {

    let luckView = QQLuckView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    //收起虚拟键盘
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.luckView.textfield_QQ.resignFirstResponder()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        luckView.btn_Search.addTarget(self, action: #selector(QQLuckViewController.searchClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(luckView)
        // Do any additional setup after loading the view.
    }

    func searchClick(){
        QueryHelper.GetQQLuckInfo(luckView.textfield_QQ.text!) { (QQluckinfo) in
            self.luckView.setData(QQluckinfo)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
