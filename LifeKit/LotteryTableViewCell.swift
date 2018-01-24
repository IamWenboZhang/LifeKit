//
//  LotteryTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/21.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LotteryTableViewCell: UITableViewCell {

    var label_expect:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.textColor = UIColor.redColor()
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    var label_time:UILabel = {
        let label = UILabel()
        label.textAlignment = .Right
        label.textColor = UIColor.redColor()
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 10)
        return label
    }()
    
    var label_name:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont.systemFontOfSize(15)
        return label
    }()
    
    var label_opencode:UILabel = {
        let label = UILabel()
        label.textAlignment = .Left
        label.textColor = UIColor.redColor()
        label.font = UIFont.systemFontOfSize(13)
        return label
    }()
    
    
    func setUI(){
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        
        contentView.addSubview(label_expect)
        contentView.addSubview(label_time)
        contentView.addSubview(label_name)
        contentView.addSubview(label_opencode)
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(3, 3, 0, -3))
        }
        
        label_expect.snp_makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(5)
            make.height.equalTo(15)
        }
        
        label_time.snp_makeConstraints { (make) in
            make.top.height.equalTo(label_expect)
            make.right.equalTo(contentView).offset(-5)
        }
        
        label_name.snp_makeConstraints { (make) in
            make.left.equalTo(label_expect)
            make.top.equalTo(label_expect).offset(15)
            make.width.equalTo(110)
            make.bottom.equalTo(contentView).offset(-5)
        }
        
        label_opencode.snp_makeConstraints { (make) in
            make.left.equalTo(label_name.snp_right).offset(5)
            make.top.bottom.equalTo(label_name)
            make.right.equalTo(label_time)
        }
        
    }
    
    func setData(lotteryInfo:LotteryResult){
        self.label_expect.text = lotteryInfo.expect + "期"
        self.label_time.text = lotteryInfo.time
        self.label_name.text = lotteryInfo.name
        self.label_opencode.text = lotteryInfo.openCode
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
