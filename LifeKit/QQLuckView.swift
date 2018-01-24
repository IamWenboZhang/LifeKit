//
//  QQLuckView.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/6.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class QQLuckView: UIView {
    
    let textfield_QQ:UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = UIColor.whiteColor()
        textfield.keyboardType = .NumberPad
        textfield.font = UIFont.systemFontOfSize(10)
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.lightTextColor().CGColor
        return textfield
    }()
    
    let btn_Search:UIButton = {
        let btn = UIButton()
        btn.setTitle("查询", forState: .Normal)
        return btn
    }()
    
    
    let line1:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGrayColor()
        view.frame.size.width = SCREEN_WIDTH - 20
        view.frame.size.height = 1
        return view
    }()
    
    
    let label_score_prompt:UILabel = {
        let label = UILabel()
        label.text = "号码得分"
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    let label_score:UILabel = {
        let label = UILabel()
        label.textAlignment = .Right
        label.font = UIFont.systemFontOfSize(30)
        return label
    }()
    
    let label_grade:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont.systemFontOfSize(30)
        return label
    }()
    
    let label_head_mingli:UILabel = {
        let label = UILabel()
        label.text = "命理分析"
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    let textview_mingli:UITextView = {
       let textview = UITextView()
        textview.editable = false
        textview.font = UIFont.systemFontOfSize(10)
        return textview
    }()
    
    let textview_des:UITextView = {
       let textview = UITextView()
        textview.editable = false
        textview.font = UIFont.systemFontOfSize(10)
        return textview
    }()
    
    let label_head_description:UILabel = {
        let label = UILabel()
        label.text = "详细描述"
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    let line2:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGrayColor()
        view.frame.size.width = SCREEN_WIDTH - 20
        view.frame.size.height = 1
        return view
    }()
    
    let line3:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGrayColor()
        view.frame.size.width = SCREEN_WIDTH - 20
        view.frame.size.height = 1
        return view
    }()
    
    func setData(QQLuckData:QQLuckRootClass){
        self.label_score.text = QQLuckData.showapiResBody.score
        self.label_grade.text = QQLuckData.showapiResBody.grade
        self.textview_mingli.text = QQLuckData.showapiResBody.analysis
        self.textview_des.text = QQLuckData.showapiResBody.desc
    }
    
    func setUI(){
        self.backgroundColor = UIColor.darkGrayColor()
        self.addSubview(textfield_QQ)
        self.addSubview(btn_Search)
        self.addSubview(line1)
        self.addSubview(label_score_prompt)
        self.addSubview(label_score)
        self.addSubview(label_grade)
        self.addSubview(line2)
        self.addSubview(label_head_mingli)
        self.addSubview(textview_mingli)
        self.addSubview(line3)
        self.addSubview(label_head_description)
        self.addSubview(textview_des)
        
        textfield_QQ.snp_makeConstraints { (make) in
            make.top.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-80)
            make.height.equalTo(20)
        }
        
        btn_Search.snp_makeConstraints { (make) in
            make.left.equalTo(textfield_QQ.snp_right).offset(15)
            make.top.height.equalTo(textfield_QQ)
            make.right.equalTo(self).offset(-10)
        }
        
        line1.snp_makeConstraints { (make) in
            make.top.equalTo(textfield_QQ.snp_bottom).offset(10)
            make.centerX.equalTo(self.snp_centerX)
            make.height.equalTo(1)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        
        label_score_prompt.snp_makeConstraints { (make) in
            make.top.equalTo(line1.snp_bottom).offset(5)
            make.left.equalTo(line1).offset(5)
//            make.centerX.equalTo(self.snp_centerX)
//            make.height.equalTo(30)
        }
        
        label_score.snp_makeConstraints { (make) in
            make.top.equalTo(label_score_prompt.snp_bottom).offset(15)
            make.right.equalTo(self.snp_centerX).offset(-10)
            make.height.equalTo(50)
        }
        
        label_grade.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_centerX).offset(10)
            make.top.height.equalTo(label_score)
        }
        
        line2.snp_makeConstraints { (make) in
            make.top.equalTo(label_score.snp_bottom).offset(15)
            make.height.left.right.centerX.equalTo(line1)
        }
        
        label_head_mingli.snp_makeConstraints { (make) in
            make.top.equalTo(line2.snp_bottom).offset(5)
            make.left.equalTo(line2).offset(5)
        }
        
        textview_mingli.snp_makeConstraints { (make) in
            make.top.equalTo(label_head_mingli.snp_bottom).offset(3)
            make.left.equalTo(label_head_mingli)
            make.right.equalTo(line1).offset(-5)
            make.height.equalTo(80)
        }
        
        line3.snp_makeConstraints { (make) in
            make.top.equalTo(textview_mingli.snp_bottom).offset(10)
//            make.centerX.equalTo(self.snp_centerX)
//            make.left.equalTo(self).offset(10)
//            make.right.equalTo(self).offset(-10)
            make.centerX.left.right.height.equalTo(line1)
        }
        
        label_head_description.snp_makeConstraints { (make) in
            make.top.equalTo(line3.snp_bottom).offset(5)
            make.left.equalTo(line3).offset(5)
        }
        
        textview_des.snp_makeConstraints { (make) in
            make.top.equalTo(label_head_description.snp_bottom).offset(3)
            make.left.equalTo(label_head_description)
            make.right.equalTo(line2).offset(-5)
            make.bottom.equalTo(self).offset(-130)
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
