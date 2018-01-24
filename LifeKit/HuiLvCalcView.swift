//
//  HuiLvCalcView.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/30.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class HuiLvCalcView: UIView,UITextFieldDelegate {

    var currencyStrs:[String]?{
        didSet{
            if let array = currencyStrs{
                self.fromCurrency.addTarget(self, action: #selector(HuiLvCalcView.chooseFromCurrency), forControlEvents: .TouchUpInside)
                self.toCurrency.addTarget(self, action: #selector(HuiLvCalcView.chooseToCurrency), forControlEvents: .TouchUpInside)
            }
        }
    }
    
    var currencyKeys:[String]?
    
    var currencyKeyValuePairs:NSDictionary?{
        didSet{
            if(currencyKeyValuePairs!.count > 0){
                self.currencyStrs = currencyKeyValuePairs?.allValues as? [String]
                self.currencyKeys = currencyKeyValuePairs?.allKeys as? [String]
                //                let v = currencyKeyValuePairs.map(
//                    { $0})
            }
        }
    }
    
    let backgroundImg:UIImageView = {
        let imgview = UIImageView()
        //imgview.contentMode = .ScaleAspectFit
        imgview.image = UIImage(named: "background_huilv")
        return imgview
    }()
    
//    let headLabel:UILabel = {
//        let label = UILabel()
//        label.text = "汇率换算器"
//        label.textAlignment = .Left
//        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 15)
//        return label
//    }()
    
    let fromCurrency:TitleBtn = {
        let btn = TitleBtn()
//        btn.setTitle("主题", forState: .Normal)
//        btn.setImage(UIImage(named: "hp_arrow_down"), forState: .Normal)
//        btn.setImage(UIImage(named: "hp_arrow_up"), forState: .Selected)
//        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        btn.sizeToFit()
        return btn
    }()
    
    let toCurrency:TitleBtn = {
        let btn = TitleBtn()
//        btn.setTitle("主题", forState: .Normal)
//        btn.setImage(UIImage(named: "hp_arrow_down"), forState: .Normal)
//        btn.setImage(UIImage(named: "hp_arrow_up"), forState: .Selected)
//        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        btn.sizeToFit()
        return btn
    }()
    
    let fromTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .Center
//        textField.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        textField.backgroundColor = UIColor.whiteColor()
        textField.borderStyle = .RoundedRect
        textField.font = UIFont.systemFontOfSize(12)
        textField.keyboardType = .NumberPad
        return textField
    }()
    
    let toTextField:UITextField = {
        let textField = UITextField()
        textField.textAlignment = .Center
        textField.backgroundColor = UIColor.whiteColor()
        textField.borderStyle = .RoundedRect
        textField.font = UIFont.systemFontOfSize(12)
//        textField.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
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
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
//        btn.titleLabel?.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        return btn
    }()
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func setData(currencyArray:NSDictionary){
        if currencyArray.count>0{
            self.currencyKeyValuePairs = currencyArray
            self.fromCurrency.setTitle("人民币", forState: .Normal)
            self.toCurrency.setTitle("美元", forState: .Normal)
            self.calcBtn.addTarget(self, action: #selector(HuiLvCalcView.calcCick), forControlEvents: .TouchUpInside)
        }
        
//        fromCurrency.addTarget(self, action: #selector(HuiLvCalcView.closeKeyboard), forControlEvents: .TouchDragOutside)
    }
    
    func chooseFromCurrency(){
        UsefulPickerView.showSingleColPicker("要转换的货币代码", data: self.currencyKeys!, defaultSelectedIndex: 2) {[unowned self] (selectedIndex, selectedValue) in
//            let v = self.currencyKeyValuePairs?.valueForKey(selectedValue)
            self.fromCurrency.setTitle(selectedValue, forState: .Normal)
//            self.selectedDataLabel.text = "选中了第\(selectedIndex)行----选中的数据为\(selectedValue)"
        }

    }
    
    func chooseToCurrency(){
        UsefulPickerView.showSingleColPicker("转换后的货币代码", data: self.currencyKeys!, defaultSelectedIndex: 2) {[unowned self] (selectedIndex, selectedValue) in
            
//            let v = self.currencyKeyValuePairs?.valueForKey(selectedValue)
//            self.toCurrency.setTitle((v as! String), forState: .Normal)
            self.toCurrency.setTitle(selectedValue, forState: .Normal)
            //            self.selectedDataLabel.text = "选中了第\(selectedIndex)行----选中的数据为\(selectedValue)"
        }
        
    }
    
    func calcCick(){
        let fromKey = self.fromCurrency.titleLabel?.text
        let fromcode = self.currencyKeyValuePairs?.valueForKey(fromKey!) as! String
        let toKey = self.toCurrency.titleLabel?.text
        let tocode = self.currencyKeyValuePairs?.valueForKey(toKey!) as! String

        //let tocode = self.toCurrency.titleLabel?.text
        let frommoney = self.fromTextField.text
        LifeHelper.GetHuiLvCalc(fromcode, toCode: tocode, money: frommoney!) { (calcdata) in
            self.toTextField.text = calcdata.showapiResBody.money
        }
    }

    
    func setUI(){
        toTextField.delegate = self
//        self.backgroundColor = UIColor.cyanColor()
        
        arrowView.image = UIImage(named: "tableview_loading")
        self.addSubview(backgroundImg)
//        self.addSubview(headLabel)
        self.addSubview(fromCurrency)
        self.addSubview(toCurrency)
        self.addSubview(fromTextField)
        self.addSubview(toTextField)
        self.addSubview(arrowView)
        self.addSubview(calcBtn)
        
        backgroundImg.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
//        headLabel.snp_makeConstraints { (make) in
//            make.top.left.equalTo(self).offset(3)
//            make.height.equalTo(20)
//        }
        
        arrowView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY).offset(-20)
            make.left.equalTo(self.snp_centerX).offset(-20)
            make.right.equalTo(self.snp_centerX).offset(20)
            make.top.equalTo(self.snp_centerY).offset(-32)
            make.bottom.equalTo(self.snp_centerY)
//            make.width.equalTo(40)
//            make.height.equalTo(24)
        }
        
        fromCurrency.snp_makeConstraints { (make) in
            make.right.equalTo(arrowView.snp_left).offset(-10)
            make.height.equalTo(50)
            make.centerY.equalTo(arrowView)
//            make.width.equalTo(80)
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
            make.left.equalTo(toCurrency)
            make.top.equalTo(toCurrency.snp_bottom).offset(8)
            make.width.height.equalTo(fromTextField)
        }
        
        calcBtn.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.left.equalTo(self.snp_centerX).offset(-15)
            make.right.equalTo(self.snp_centerY).offset(15)
            make.top.equalTo(fromTextField.snp_centerY).offset(-9)
            make.bottom.equalTo(fromTextField.snp_centerY).offset(9)
//            make.width.equalTo(30)
//            make.height.equalTo(18)
            make.centerY.equalTo(fromTextField)
        }
    }
    
//
//    func closeKeyboard(){
//        self.fromTextField.resignFirstResponder()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
