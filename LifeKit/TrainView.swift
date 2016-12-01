//
//  TrainView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/2.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class TrainView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    let timebutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, weatherview_pointY,SCREEN_WIDTH-20,btn_height))
    
    let ticketbutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, BOTTOM_BTN_POINTY,SCREEN_WIDTH-20,btn_height))
    
    let backgroundimgview = UIImageView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    func setTimeView(){
        timebutton.backgroundColor = UIColor.brownColor()
        timebutton.alpha = 0.9
        timebutton.setImage(UIImage(named: "clock_48px"), forState: .Normal)
        timebutton.setTitle("  列车路线", forState: .Normal)
        timebutton.titleLabel?.font = UIFont.systemFontOfSize(30)
        timebutton.setNeedsLayout()
        timebutton.layer.cornerRadius = 8
        timebutton.layer.masksToBounds = true;
        timebutton.addTarget(self, action: #selector(TrainView.timeviewClick), forControlEvents: .TouchUpInside)
        self.addSubview(timebutton)
    }
    
    func setTicketView(){
        ticketbutton.backgroundColor = UIColor.brownColor()
        ticketbutton.alpha = 0.9
        ticketbutton.setImage(UIImage(named: "train_48px"), forState: .Normal)
        ticketbutton.setTitle("  车票查询", forState: .Normal)
        ticketbutton.titleLabel?.font = UIFont.systemFontOfSize(30)
        ticketbutton.layer.cornerRadius = 8
        ticketbutton.layer.masksToBounds = true;
        ticketbutton.setNeedsLayout()
        ticketbutton.addTarget(self, action: #selector(TrainView.ticketviewClick), forControlEvents: .TouchUpInside)
        self.addSubview(ticketbutton)
    }
    

    func timeviewClick(){
        NSLog("时刻按钮被点击")
    }
    
    func ticketviewClick(){
        NSLog("车票按钮被点击")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label_title = UILabel(frame: CGRectMake(15,30,100,40))
        label_title.text = "火车"
        label_title.font = UIFont.systemFontOfSize(30)
        label_title.textAlignment = .Left
        backgroundimgview.image = UIImage(named: "backgroundimg")
        self.addSubview(backgroundimgview)
        self.addSubview(label_title)
        setTimeView()
        setTicketView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
