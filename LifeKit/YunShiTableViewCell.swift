//
//  YunShiTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class YunShiTableViewCell: UITableViewCell {

    let label_Yunshi = UILabel()
    
    var imgView_YunShi = UIImageView()
    
    var textview_YunShi = UITextView()
    
//    let imgview_background:UIImageView = {
//        let imgview = UIImageView()
//        imgview.image = UIImage(named: "bkg_constellation")
//        imgview.contentMode = .ScaleAspectFit
//        return imgview
//    }()
//
    
    func setData(img:UIImage,text:String,title:String){
        self.label_Yunshi.text = title
        self.imgView_YunShi.image = img
        self.textview_YunShi.text = text
    }
    
    
    func setUI(){
        textview_YunShi.editable = false
        backgroundColor = UIColor.lightGrayColor()
        
        contentView.backgroundColor = UIColor.whiteColor()
//        contentView.addSubview(imgview_background)
        contentView.addSubview(label_Yunshi)
        contentView.addSubview(imgView_YunShi)
        contentView.addSubview(textview_YunShi)
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, 0, -5))
        }
//        
//        imgview_background.snp_makeConstraints { (make) in
//            make.left.top.right.bottom.equalTo(self)
//        }
        
        label_Yunshi.snp_makeConstraints { (make) in
            make.right.equalTo(contentView.snp_centerX).offset(-5)
            make.top.equalTo(5)
        }

        imgView_YunShi.snp_makeConstraints { (make) in
//            make.centerX.equalTo(contentView.snp_centerX)
//            make.top.equalTo(20)
//            make.left.equalTo(contentView).offset(40)
//            make.right.equalTo(contentView).offset(-40)
            make.left.equalTo(contentView.snp_centerX).offset(5)
            make.top.equalTo(5)
            make.right.equalTo(contentView).offset(-20)
            make.height.equalTo(label_Yunshi)
        }
        
        textview_YunShi.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp_centerX).offset(5)
            make.top.equalTo(imgView_YunShi.snp_bottom)
            make.left.right.equalTo(contentView)
            make.bottom.equalTo(-5)
        }
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
