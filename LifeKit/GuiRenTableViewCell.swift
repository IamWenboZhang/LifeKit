//
//  GuiRenTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/23.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class GuiRenTableViewCell: UITableViewCell {

    var headLabel:UILabel = {
        //let label = UILabel(frame: CGRectMake(5,5,100,15))
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    var guirenLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .Right
        return label
    }()
    
    var guirenImgView:UIImageView = {
       let imgView = UIImageView()
    return imgView
    }()
    
    func setUI(){
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        
        contentView.addSubview(headLabel)
        contentView.addSubview(guirenLabel)
        contentView.addSubview(guirenImgView)
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, 0, -5))
        }
        
        headLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(3)
            make.height.equalTo(15)
        }
        
        guirenLabel.snp_makeConstraints { (make) in
            make.right.equalTo(contentView.snp_centerX).offset(-10.5)
            make.top.equalTo(contentView).offset(20)
            make.centerY.equalTo(contentView.snp_centerY)
        }
        
        guirenImgView.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_centerX).offset(10.5)
            make.top.equalTo(contentView).offset(20)
            make.centerY.equalTo(contentView.snp_centerY)
            //make.height.equalTo(contentView)
            make.width.equalTo(guirenImgView.snp_height)
        }
    }
    
    func setData(title:String,guirenstar:String,guirenImg:UIImage) {
        self.headLabel.text = title
        self.guirenLabel.text = guirenstar
        self.guirenImgView.image = guirenImg
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

}
