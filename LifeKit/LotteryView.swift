//
//  LotteryView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/3.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LotteryView: UIView {


    
    let queryBtn = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, weatherview_pointY,SCREEN_WIDTH-20,btn_height))
    
    let newBtn = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, BOTTOM_BTN_POINTY,SCREEN_WIDTH-20,btn_height))
    
    let backgroundimgview = UIImageView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    func setLQueryView(){
        queryBtn.backgroundColor = UIColor.brownColor()
        queryBtn.alpha = 0.9
        queryBtn.setImage(UIImage(named: "history_64px"), forState: .Normal)
        queryBtn.setTitle("  彩票查询", forState: .Normal)
        queryBtn.titleLabel?.font = UIFont.systemFontOfSize(30)
        queryBtn.setNeedsLayout()
        queryBtn.layer.cornerRadius = 8
        queryBtn.layer.masksToBounds = true
        self.addSubview(queryBtn)
    }
    
    func setNewLotteryView(){
        newBtn.backgroundColor = UIColor.brownColor()
        newBtn.alpha = 0.9
        newBtn.setImage(UIImage(named: "new_64px"), forState: .Normal)
        newBtn.setTitle("  开奖信息", forState: .Normal)
        newBtn.titleLabel?.font = UIFont.systemFontOfSize(30)
        newBtn.layer.cornerRadius = 8
        newBtn.layer.masksToBounds = true
        newBtn.setNeedsLayout()
        
        self.addSubview(newBtn)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label_title = UILabel(frame: CGRectMake(15,30,100,40))
        label_title.text = "彩票"
        label_title.font = UIFont.systemFontOfSize(30)
        label_title.textAlignment = .Left
        backgroundimgview.image = UIImage(named: "backgroundimg")
        self.addSubview(backgroundimgview)
        self.addSubview(label_title)
        setLQueryView()
        setNewLotteryView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
