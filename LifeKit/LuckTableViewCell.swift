//
//  LuckTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/18.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class LuckTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var form1 : LuckForm = {
        let view = LuckForm()
        return view
    }()
    
    var form2 : LuckForm = {
        let view = LuckForm()
        return view
    }()
    
    func setTitle(title1:String,title2:String) {
        form1.headLabel.text = ""
        form2.headLabel.text = ""
        form1.headLabel.text = title1
        form2.headLabel.text = title2
    }
    
    func setUI(){
        
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(form1)
        contentView.addSubview(form2)

        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, 0, -5))
        }

        form1.snp_makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView.snp_centerX).offset(-20)
            make.height.equalTo(contentView)
        }
        
        form2.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_centerX).offset(20)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.top.equalTo(contentView)
            make.height.equalTo(contentView)
//            make.left.equalTo(form1.snp_right).offset(5)
//            make.right.top.bottom.equalTo(contentView)
        }
        
    }
}
