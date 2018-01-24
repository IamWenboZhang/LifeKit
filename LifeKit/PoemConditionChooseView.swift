//
//  PoemConditionChooseView.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/14.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class PoemConditionChooseView: UIView {
    
    let segement_5or7:UISegmentedControl = {
        let array = ["五言","七言"]
        let segement = UISegmentedControl(items: array)
        segement.selectedSegmentIndex = 0
        return segement
    }()
    
    let segement_type:UISegmentedControl = {
        let array = ["藏头","藏尾","藏中","递增","递减"]
        let segement = UISegmentedControl(items: array)
        segement.selectedSegmentIndex = 0
        return segement
    }()
    
    let segement_yayuntype:UISegmentedControl = {
        let array = ["双句一压","双句押韵","一三四压"]
        let segement = UISegmentedControl(items: array)
        segement.selectedSegmentIndex = 0
        return segement
    }()
    
    let textfield_key:UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFontOfSize(10)
        textfield.borderStyle = .RoundedRect
        return textfield
    }()
    
    let btn_search:UIButton = {
        let btn = UIButton()
        btn.setTitle("生成", forState: .Normal)
        //btn.titleLabel?.textColor = UIColor.cyanColor()
        btn.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
//        btn.titleLabel?.font = UIFont.systemFontOfSize(10)
        return btn
    }()
    
    func setUI(){
        
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(segement_5or7)
        self.addSubview(segement_type)
        self.addSubview(segement_yayuntype)
        self.addSubview(textfield_key)
        self.addSubview(btn_search)
        
        segement_5or7.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            make.top.equalTo(self).offset(15)
            make.height.equalTo(25)
        }
        
        segement_type.snp_makeConstraints { (make) in
            make.height.left.right.equalTo(segement_5or7)
            make.top.equalTo(segement_5or7.snp_bottom).offset(10)
        }
        
        segement_yayuntype.snp_makeConstraints { (make) in
            make.height.left.right.equalTo(segement_5or7)
            make.top.equalTo(segement_type.snp_bottom).offset(10)
        }
        
        btn_search.snp_makeConstraints { (make) in
            make.right.equalTo(segement_5or7)
            make.width.equalTo(60)
            make.left.equalTo(textfield_key.snp_right).offset(8)
            make.top.height.bottom.equalTo(textfield_key)
        }
        
        textfield_key.snp_makeConstraints { (make) in
            make.height.left.equalTo(segement_5or7)
//            make.right.equalTo(btn_search.snp_left).offset(-8)
            make.top.equalTo(segement_yayuntype.snp_bottom).offset(10)
            make.bottom.equalTo(self).offset(-15)
        }
        
        
        
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
