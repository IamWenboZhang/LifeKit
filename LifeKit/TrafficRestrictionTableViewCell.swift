//
//  NoPassageTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/25.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class TrafficRestrictionTableViewCell: UITableViewCell {

    let labelCity:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 20)
        return label
    }()
    
    let imgViewNoPassage:UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .ScaleAspectFit
        return imgView
    }()
    
    let labelTime:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    
    let labelConfineWay:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    let labelPunlish:UILabel = {
       let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    let textView:UITextView = {
        let textview = UITextView()
        textview.editable = false
        textview.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return textview
    }()
    
    func setUI(){
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(labelCity)
        contentView.addSubview(imgViewNoPassage)
        contentView.addSubview(labelTime)
        contentView.addSubview(labelConfineWay)
        contentView.addSubview(labelPunlish)
        contentView.addSubview(textView)
        

        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(10, 10, 0, -10))
        }
        
        labelCity.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(40)
        }
        
        imgViewNoPassage.snp_makeConstraints { (make) in
            make.top.equalTo(labelCity.snp_bottom)
            make.left.right.equalTo(contentView)
            make.height.equalTo(110)
        }
        
        labelTime.snp_makeConstraints { (make) in
            make.top.equalTo(imgViewNoPassage.snp_bottom).offset(5)
            make.left.equalTo(contentView).offset(3)
            make.right.equalTo(contentView).offset(-3)
            make.height.equalTo(15)
        }
        
        labelConfineWay.snp_makeConstraints { (make) in
            make.top.equalTo(labelTime.snp_bottom).offset(3)
            make.left.equalTo(contentView).offset(3)
            make.right.equalTo(contentView).offset(-3)
            make.height.equalTo(15)
        }
        
        labelPunlish.snp_makeConstraints { (make) in
            make.top.equalTo(labelConfineWay.snp_bottom).offset(3)
            make.left.equalTo(contentView).offset(3)
            make.right.equalTo(contentView).offset(-3)
            make.height.equalTo(15)
        }
        
        textView.snp_makeConstraints { (make) in
            make.top.equalTo(labelPunlish.snp_bottom).offset(3)
            make.bottom.equalTo(contentView).offset(-3)
            make.left.equalTo(contentView).offset(3)
            make.right.equalTo(contentView).offset(-3)
            make.height.equalTo(100)
        }
    }
    
    func setData(trafficrestictioninfo: TrafficRestrictionData){
        self.labelCity.text = trafficrestictioninfo.areaName
        let img = LibByMrOwl.getUIImageByUrl(trafficrestictioninfo.img)
        self.imgViewNoPassage.image = img
        self.labelTime.text =  "限行日期：" + trafficrestictioninfo.begDate + "——" + trafficrestictioninfo.endDate
        self.labelConfineWay.text = "限行方式：" + trafficrestictioninfo.confineWay
        self.labelPunlish.text = "惩罚措施：" + trafficrestictioninfo.punish
        self.textView.text = trafficrestictioninfo.descriptionField
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
