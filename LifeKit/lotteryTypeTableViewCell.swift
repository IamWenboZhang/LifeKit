//
//  lotteryTypeTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/22.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class lotteryTypeTableViewCell: UITableViewCell {

    let label_issuer:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    let label_area:UILabel = {
        let label = UILabel()
        label.textAlignment = .Right
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    let label_descr:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(18)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let label_notes:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFontOfSize(12)
        return label
    }()
    
    func setUI(){
        contentView.addSubview(label_issuer)
        contentView.addSubview(label_area)
        contentView.addSubview(label_descr)
        contentView.addSubview(label_notes)
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(3, 3, 0, -3))
        }
        
        label_issuer.snp_makeConstraints { (make) in
            make.left.top.equalTo(contentView).offset(5)
            make.height.equalTo(15)
        }
        
        label_area.snp_makeConstraints { (make) in
            make.top.height.equalTo(label_issuer)
            make.right.equalTo(contentView).offset(-5)
        }
        
        label_descr.snp_makeConstraints { (make) in
            make.center.equalTo(contentView)
            make.left.equalTo(contentView).offset(5)
            make.right.equalTo(contentView).offset(-5)
            //make.height.equalTo(25)
        }
        
        label_notes.snp_makeConstraints { (make) in
            make.top.equalTo(label_descr.snp_bottom).offset(10)
            make.bottom.equalTo(contentView).offset(-5)
            make.left.right.equalTo(label_descr)
        }
    }
    
    func setData(lotteryType:LotteryTypeResult){
        self.label_issuer.text = lotteryType.issuer
        if(lotteryType.area.length > 0){
            self.label_area.text = "地区:"+lotteryType.area
        }        
        self.label_descr.text = lotteryType.descr
        self.label_notes.text = lotteryType.notes
    }
    
    func setData(title:String){
        self.label_issuer.text = ""
        self.label_area.text = ""
        self.label_descr.text = title
        self.label_notes.text = ""

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
