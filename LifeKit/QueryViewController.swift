//
//  TrainViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class QueryViewController: UIViewController {

    let trainview = QueryView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    let huilvVC = HuiLvViewController()
    
    let QQVC = QQLuckViewController()
    
    let poemVC = PoemViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUI(){
        
        self.trainview.ticketbutton.addTarget(self, action: #selector(QueryViewController.huilvClick), forControlEvents: .TouchUpInside)
        self.trainview.timebutton.addTarget(self, action: #selector(QueryViewController.QQClick), forControlEvents: .TouchUpInside)
        self.trainview.poembutton.addTarget(self, action: #selector(QueryViewController.poemClick), forControlEvents: .TouchUpInside)
        self.view.addSubview(trainview)
    }
    
    func poemClick(){
        navigationController?.pushViewController(poemVC, animated: true)
    }
    
    
    func QQClick(){
        navigationController?.pushViewController(QQVC, animated: true)
    }
    
    func huilvClick(){
        navigationController?.pushViewController(huilvVC, animated: true)
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
