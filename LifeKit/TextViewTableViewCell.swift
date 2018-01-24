//
//  textViewTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/11/24.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {

    var headLabel:UILabel = {
        //let label = UILabel(frame: CGRectMake(5,5,100,15))
        let label = UILabel()
        label.textAlignment = .Left
        label.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 8)
        return label
    }()
    
    var textView:UITextView = {
        let view = UITextView()
        view.editable = false
        return view
    }()
    
//    let imgview_background:UIImageView = {
//        let imgview = UIImageView()
//        imgview.image = UIImage(named: "bkg_constellation")
//        imgview.contentMode = .ScaleAspectFill
//        return imgview
//    }()

    
    func setUI(){
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        
//        contentView.addSubview(imgview_background)
        contentView.addSubview(headLabel)
        contentView.addSubview(textView)
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(5, 5, -2.5, -5))
        }

//        imgview_background.snp_makeConstraints { (make) in
//            make.left.top.right.bottom.equalTo(contentView)
//        }
        
        headLabel.snp_makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(3)
            make.height.equalTo(15)
        }
        
        textView.snp_makeConstraints { (make) in
            make.top.equalTo(headLabel.snp_bottom).offset(3)
            make.left.equalTo(headLabel)
            make.right.bottom.equalTo(contentView).offset(-3)
        }
        
    }

    func setData(title:String,content:String){
        self.headLabel.text = title
        self.textView.text = content
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
