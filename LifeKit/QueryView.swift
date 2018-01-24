//
//  TrainView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/2.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class QueryView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    let poembutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, weatherview_pointY-btn_height-10,SCREEN_WIDTH-20,btn_height))

    let timebutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, weatherview_pointY,SCREEN_WIDTH-20,btn_height))
    
    let ticketbutton = UIButton(frame: CGRectMake(BOTTOM_BTN_POINTX, BOTTOM_BTN_POINTY,SCREEN_WIDTH-20,btn_height))
    
    let backgroundimgview = UIImageView(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
    
    func setQQView(){
        timebutton.backgroundColor = UIColor.brownColor()
        timebutton.alpha = 0.9
        timebutton.setImage(UIImage(named: "qq_48px"), forState: .Normal)
        timebutton.setTitle("  QQ运势", forState: .Normal)
        timebutton.titleLabel?.font = UIFont.systemFontOfSize(30)
        timebutton.setNeedsLayout()
        timebutton.layer.cornerRadius = 8
        timebutton.layer.masksToBounds = true
        self.addSubview(timebutton)
    }
    
    func setHuiLvView(){
        ticketbutton.backgroundColor = UIColor.brownColor()
        ticketbutton.alpha = 0.9
        ticketbutton.setImage(UIImage(named: "coin_48px"), forState: .Normal)
        ticketbutton.setTitle("  汇率查询", forState: .Normal)
        ticketbutton.titleLabel?.font = UIFont.systemFontOfSize(30)
        ticketbutton.layer.cornerRadius = 8
        ticketbutton.layer.masksToBounds = true
        ticketbutton.setNeedsLayout()
     
        self.addSubview(ticketbutton)
    }
    
    func setPoemView(){
        poembutton.backgroundColor = UIColor.brownColor()
        poembutton.alpha = 0.9
        poembutton.setImage(UIImage(named: "poetry_48px"), forState: .Normal)
        poembutton.setTitle("  为你写诗", forState: .Normal)
        poembutton.titleLabel?.font = UIFont.systemFontOfSize(30)
        poembutton.setNeedsLayout()
        poembutton.layer.cornerRadius = 8
        poembutton.layer.masksToBounds = true
        self.addSubview(poembutton)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label_title = UILabel(frame: CGRectMake(15,30,100,40))
        label_title.text = "娱乐"
        label_title.font = UIFont.systemFontOfSize(30)
        label_title.textAlignment = .Left
        backgroundimgview.image = UIImage(named: "backgroundimg")
        self.addSubview(backgroundimgview)
        self.addSubview(label_title)
        setQQView()
        setHuiLvView()
        setPoemView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
