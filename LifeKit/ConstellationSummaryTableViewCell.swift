//
//  ConstellationSummaryTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/17.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class ConstellationSummaryTableViewCell: UITableViewCell {

    var ConstellationInfo:ConstellationRootClass?{
        didSet{
            if let info = ConstellationInfo{
                self.imgview_constellation.image = UIImage(named: (info.showapiResBody.star)!)
                self.label_constellation.text = LifeHelper.PinYinToWenZi_Consellation(info.showapiResBody.star)
                self.label_date.text = info.showapiResBody.day.time
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUI()
        // Configure the view for the selected state
    }
    
    
    func setUI(){
        self.backgroundColor = UIColor.lightTextColor()
        contentView.addSubview(imgview_constellation)
        contentView.addSubview(label_constellation)
        contentView.addSubview(label_date)
        contentView.addSubview(label_luck)
        contentView.addSubview(imgView_luck)
        
//        
//        smallIconView.snp_makeConstraints { (make) in
//            make.left.right.top.equalTo(contentView)
//            make.height.equalTo(160)
//        }
//        
//        headImgView.snp_makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 51, height: 51))
//            make.right.equalTo(contentView).offset(-10)
//            make.top.equalTo(smallIconView.snp_bottom).offset(-10)
//        }
//        
//        authView.snp_makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 14, height: 14))
//            make.bottom.right.equalTo(headImgView)
//        }
//        
//        authorLabel.snp_makeConstraints { (make) in
//            make.right.equalTo(headImgView.snp_left).offset(-10)
//            make.top.equalTo(smallIconView.snp_bottom).offset(8)
//        }
        
        
        imgview_constellation.snp_makeConstraints { (make) in
            make.top.equalTo(contentView).offset(30)
            make.size.equalTo(CGSize(width: 64, height: 64))
            make.centerX.equalTo(contentView.snp_centerX)
           // make.left.right.equalTo(contentView).offset(80)
        }
        
        label_constellation.snp_makeConstraints { (make) in
            make.top.equalTo(imgview_constellation.snp_bottom).offset(5)
            make.centerX.equalTo(contentView.snp_centerX)
        }
        
        label_date.snp_makeConstraints { (make) in
            make.top.equalTo(label_constellation.snp_bottom).offset(3)
            make.centerX.equalTo(contentView.snp_centerX)
        }
        
        label_luck.snp_makeConstraints { (make) in
            //make.left.equalTo(contentView).offset(50)
            make.right.equalTo(contentView.snp_centerX)
            make.top.equalTo(label_date.snp_bottom).offset(15)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        imgView_luck.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_centerX)
            make.height.equalTo(label_luck)
            make.top.bottom.equalTo(label_luck)
        }

    }

    let imgview_constellation:UIImageView = {
       let imgView = UIImageView()
        imgView.contentMode = .ScaleAspectFit
        return imgView
    }()
    
    let label_constellation:UILabel = {
       let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 25)
        return label
    }()
    
    let label_date:UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 15)
        return label
    }()
    
    let label_luck:UILabel = {
        let label = UILabel()
        label.text = "综合运势："
        label.textAlignment = .Center
        return label
    }()
    
    let imgView_luck:UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .Center
        return imgView
    }()

}
