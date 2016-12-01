//
//  constellation.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/8.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class ConstellationBox: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var Button = UIButton()
    var Label_constellation = UILabel()
    var View_fengexian = UIView()
    var ImgView_constellation = UIImageView()
    var Label_todaywork = UILabel()
    var Label_todaymoney = UILabel()
    var Label_todaylove = UILabel()
    var ImgView_todaymoney = UIImageView()
    var ImgView_todaywork = UIImageView()
    var ImgView_todaylove = UIImageView()
    
    func setConstellationView(constellationdata: ConstellationRootClass){
        self.subviews.map (
            { $0.removeFromSuperview() }
        )
       
        let label_constellation_width = self.bounds.size.width/2.5
        let label_constellation_height = (self.bounds.size.height-30)/2
        let label_todayluck_width = CGFloat(45)
        let label_todayLuck_height = (self.bounds.size.height-30)/5
        
        let centerPointX = self.bounds.size.width/2
        let leftPointX = centerPointX-6-label_constellation_width
        let label_todayNotice_content_width = self.bounds.size.width - leftPointX*2 - label_todayluck_width
        
        self.Button = UIButton(frame: CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height))
        self.Button.addTarget(self, action: #selector(ConstellationBox.ViewClick), forControlEvents: .TouchUpInside)
        self.Label_constellation = UILabel(frame: CGRectMake(leftPointX,10,label_constellation_width,label_constellation_height))
        self.Label_constellation.textAlignment = .Center
        self.Label_constellation.font = UIFont.systemFontOfSize(18)
        self.Label_todaywork = UILabel(frame: CGRectMake(leftPointX,15+label_constellation_height,label_todayluck_width,label_todayLuck_height))
        self.Label_todaywork.textAlignment = .Center
        self.Label_todaywork.font = UIFont.systemFontOfSize(10)
        self.Label_todaymoney = UILabel(frame: CGRectMake(leftPointX,15+label_constellation_height+label_todayLuck_height,label_todayluck_width,label_todayLuck_height))
        self.Label_todaymoney.textAlignment = .Center
        self.Label_todaymoney.font = UIFont.systemFontOfSize(10)
        self.View_fengexian = UIView(frame: CGRectMake(centerPointX-0.5,8,1,label_constellation_height+4))
        self.View_fengexian.backgroundColor = UIColor.lightGrayColor()
        self.ImgView_constellation = UIImageView(frame: CGRectMake(centerPointX+11,10,label_constellation_height,label_constellation_height))
        self.ImgView_todaywork = UIImageView(frame: CGRectMake(leftPointX + label_todayluck_width, 15+label_constellation_height,label_todayNotice_content_width,label_todayLuck_height))
        self.ImgView_todaymoney = UIImageView(frame: CGRectMake(leftPointX + label_todayluck_width,15+label_constellation_height+label_todayLuck_height,label_todayNotice_content_width,label_todayLuck_height))

        self.Label_todaylove = UILabel(frame: CGRectMake(leftPointX,15+label_constellation_height+label_todayLuck_height+label_todayLuck_height,label_todayluck_width,label_todayLuck_height))
        self.Label_todaylove.textAlignment = .Left
        self.Label_todaylove.font = UIFont.systemFontOfSize(10)
        self.ImgView_todaylove = UIImageView(frame: CGRectMake(leftPointX + label_todayluck_width, 15+label_constellation_height+label_todayLuck_height+label_todayLuck_height, label_todayNotice_content_width, label_todayLuck_height))
        let name = LifeHelper.PinYinToWenZi_Consellation(constellationdata.showapiResBody.star)
        self.Label_constellation.text = name
        self.Label_todaylove.text = "爱情指数:"
        self.Label_todaywork.text = "工作指数:"
        self.Label_todaymoney.text = "财运指数:"
        self.ImgView_todaymoney.image = UIImage(named: "car_32px")
        self.ImgView_todaywork.image = UIImage(named: "car_32px")
        self.ImgView_todaylove.image = UIImage(named: "car_32px")
        self.ImgView_constellation.image = UIImage(named: constellationdata.showapiResBody.star)
        
        self.addSubview(Button)
        self.addSubview(Label_constellation)
        self.addSubview(Label_todaywork)
        self.addSubview(Label_todaymoney)
        self.addSubview(View_fengexian)
        self.addSubview(ImgView_todaymoney)
        self.addSubview(ImgView_todaylove)
        self.addSubview(ImgView_todaywork)
        self.addSubview(ImgView_constellation)
        self.addSubview(Label_todaylove)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 0.9
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true;
    }
    
    func ViewClick(){
        NSLog("ConstellationView被点击")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
