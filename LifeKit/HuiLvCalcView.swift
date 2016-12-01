//
//  HuiLvCalcView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/30.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class HuiLvCalcView: UIView,UITextFieldDelegate {

    
    let headLabel:UILabel = {
        let label = UILabel()
        label.text = "汇率换算"
        label.textAlignment = .Left
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    let fromCurrency:UIButton = {
        let btn = UIButton()
        btn.setTitle("主题", forState: .Normal)
        btn.setImage(UIImage(named: "hp_arrow_down"), forState: .Normal)
        btn.setImage(UIImage(named: "hp_arrow_up"), forState: .Selected)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.sizeToFit()
        return btn
    }()
    
    let toCurrency:UIButton = {
        let btn = UIButton()
        btn.setTitle("主题", forState: .Normal)
        btn.setImage(UIImage(named: "hp_arrow_down"), forState: .Normal)
        btn.setImage(UIImage(named: "hp_arrow_up"), forState: .Selected)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.sizeToFit()
        return btn
    }()
    
    let fromTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .Center
        textField.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return textField
    }()
    
    let toTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .Center
        textField.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return textField
    }()
    
    let arrowView:UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .ScaleAspectFit
        return imgView
    }()
    
    let calcBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("转换", forState: .Normal)
        return btn
    }()
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func setUI(){
        toTextField.delegate = self
        self.addSubview(headLabel)
        self.addSubview(fromCurrency)
        self.addSubview(toCurrency)
        self.addSubview(fromTextField)
        self.addSubview(toTextField)
        self.addSubview(arrowView)
        self.addSubview(calcBtn)
        
        headLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(self).offset(3)
            make.height.equalTo(15)
        }
        
        arrowView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY)
            make.width.equalTo(40)
            make.height.equalTo(23)
        }
        
        fromCurrency.snp_makeConstraints { (make) in
            make.right.equalTo(arrowView.snp_left).offset(-10)
            make.height.equalTo(30)
            make.centerY.equalTo(arrowView)
            make.width.equalTo(50)
        }
        
        toCurrency.snp_makeConstraints { (make) in
            make.width.height.centerY.equalTo(fromCurrency)
            make.left.equalTo(arrowView.snp_right).offset(10)
        }
        
        fromTextField.snp_makeConstraints { (make) in
            make.left.right.equalTo(fromCurrency)
            make.height.equalTo(20)
            make.top.equalTo(fromCurrency.snp_bottom).offset(8)
        }
        
        toTextField.snp_makeConstraints { (make) in
            make.left.right.equalTo(toCurrency)
            make.height.equalTo(20)
            make.top.equalTo(toCurrency.snp_bottom).offset(8)
        }
        
        calcBtn.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(30)
            make.height.equalTo(18)
            make.centerY.equalTo(fromTextField)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
