//
//  WeiZhangViewController.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/3.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class WeiZhangViewController: UIViewController,UIWebViewDelegate {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let weizhangview = WeiZhangView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        weizhangview.WebView.delegate = self
        let nsurl = NSURL(string: "http://m.cheshouye.com/api/weizhang/")
        let request = NSURLRequest(URL: nsurl!)
        setup()
        weizhangview.WebView.loadRequest(request)
        self.view.addSubview(weizhangview)
    }
    
    
    func setup(){
//        // 设置左右item
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "TOP", style: .Plain, target: self, action: #selector(WeiZhangViewController.rightItemClick))
        // 设置titleView
        let titleButton = UIButton()
        titleButton.setTitle("违章查询", forState: .Normal)
        navigationItem.titleView = titleButton
        navigationItem.backBarButtonItem = UIBarButtonItem()
    }
    
    func rightItemClick(){
        NSLog("右按钮被点击")
    }

    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let result = webView.stringByEvaluatingJavaScriptFromString("document.documentElement.getElementsByClassName('bkcsy')[0].remove()")
        NSLog(result!)
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
