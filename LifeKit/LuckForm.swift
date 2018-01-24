//
//  MyForm.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/18.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LuckForm: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var headLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    var dataView:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(12)
        return label
    }()
    
    func setUI(){
        
        backgroundColor = UIColor.lightGrayColor()
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(headLabel)
        self.addSubview(dataView)
       

        
        headLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(self).offset(3)
            make.height.equalTo(15)
        }
        
        dataView.snp_makeConstraints { (make) in
            make.top.equalTo(headLabel.snp_bottom).offset(3)
            make.left.equalTo(self).offset(3)
            make.right.bottom.equalTo(self).offset(-3)
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
