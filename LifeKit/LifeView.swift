//
//  LifeView.swift
//  LifeKit
//
//  Created by 张文博 on 16/10/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LifeView: UIView{

    //数据源
    
    //控件
    let weatherbox = WeatherBox(frame: CGRectMake(BOTTOM_BTN_POINTX,weatherview_pointY,btn_width,btn_height))
    
    let constellationbox = ConstellationBox(frame: CGRectMake(starview_pointX,weatherview_pointY,btn_width,btn_height))
    
    let wuliubutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, BOTTOM_BTN_POINTY,SCREEN_WIDTH-20,btn_height))
    
    let backgroundimgview = UIImageView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    
    func setWuliuView(){
        wuliubutton.backgroundColor = UIColor.brownColor()
        wuliubutton.alpha = 0.9
        wuliubutton.setImage(UIImage(named: "box_48px"), forState: .Normal)
        wuliubutton.setTitle("  物流查询", forState: .Normal)
        wuliubutton.titleLabel?.font = UIFont.systemFontOfSize(20)
        wuliubutton.setNeedsLayout()
        wuliubutton.addTarget(self, action: #selector(LifeView.wuliuviewClick), forControlEvents: .TouchUpInside)
        wuliubutton.layer.cornerRadius = 8
        wuliubutton.layer.masksToBounds = true;
        self.addSubview(wuliubutton)
    }
    
    func wuliuviewClick(){
        NSLog("WuliuView被点击")
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label_title = UILabel(frame: CGRectMake(15,30,100,40))
        label_title.text = "生活"
        //label_title.adjustsFontSizeToFitWidth = true
        label_title.font = UIFont.init(name: "CODE LIGHT", size: 30.0)
        label_title.textAlignment = .Left
        backgroundimgview.image = UIImage(named: "backgroundimg")
        self.addSubview(backgroundimgview)
        self.addSubview(label_title)
        self.addSubview(weatherbox)
        self.addSubview(constellationbox)
        setWuliuView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
