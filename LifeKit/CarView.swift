//
//  CarView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/2.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class CarView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    let noThoroughfareBtn = UIButton(frame: CGRectMake(starview_pointX,weatherview_pointY,btn_width,btn_height))
    
    let gasBtn = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX,weatherview_pointY,btn_width,btn_height))
    
    let weizhangbutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, BOTTOM_BTN_POINTY,SCREEN_WIDTH-20,btn_height))
    
    let backgroundimgview = UIImageView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    func setNoThoroughfareBtn(){
        noThoroughfareBtn.backgroundColor = UIColor.brownColor()
        noThoroughfareBtn.alpha = 0.9
        noThoroughfareBtn.setImage(UIImage(named: "denied_48px"), forState: .Normal)
        noThoroughfareBtn.setTitle("  禁行查询", forState: .Normal)
        noThoroughfareBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        noThoroughfareBtn.setNeedsLayout()
        noThoroughfareBtn.layer.cornerRadius = 8
        noThoroughfareBtn.layer.masksToBounds = true;
        noThoroughfareBtn.addTarget(self, action: #selector(CarView.jinxingviewClick), forControlEvents: .TouchUpInside)
        self.addSubview(noThoroughfareBtn)
    }
    
    func setWeiZhangView(){
        weizhangbutton.backgroundColor = UIColor.brownColor()
        weizhangbutton.alpha = 0.9
        weizhangbutton.setImage(UIImage(named: "clipboard_48px"), forState: .Normal)
        weizhangbutton.setTitle("  违章查询", forState: .Normal)
        weizhangbutton.titleLabel?.font = UIFont.systemFontOfSize(20)
        weizhangbutton.layer.cornerRadius = 8
        weizhangbutton.layer.masksToBounds = true;
        weizhangbutton.setNeedsLayout()
        self.addSubview(weizhangbutton)
    }
    
    func setGasView(){
        gasBtn.backgroundColor = UIColor.brownColor()
        gasBtn.alpha = 0.9
        gasBtn.setImage(UIImage(named: "gas_48px"), forState: .Normal)
        gasBtn.setTitle("  油价查询", forState: .Normal)
        gasBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        gasBtn.setNeedsLayout()
        gasBtn.layer.cornerRadius = 8
        gasBtn.layer.masksToBounds = true;
        gasBtn.addTarget(self, action: #selector(CarView.gasviewClick), forControlEvents: .TouchUpInside)
        self.addSubview(gasBtn)
        
    }
    
    func jinxingviewClick(){
        NSLog("禁行查询被点击")
    }
    
    func gasviewClick(){
        NSLog("油价查询被点击")
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label_title = UILabel(frame: CGRectMake(15,30,100,40))
        label_title.text = "汽车"
        label_title.font = UIFont.systemFontOfSize(30)
        label_title.textAlignment = .Left
        backgroundimgview.image = UIImage(named: "backgroundimg")
        self.addSubview(backgroundimgview)
        self.addSubview(label_title)
        setNoThoroughfareBtn()
        setGasView()
        setWeiZhangView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
