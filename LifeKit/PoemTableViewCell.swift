//
//  PoemTableViewCell.swift
//  LifeKit
//
//  Created by 张文博 on 16/12/15.
//  Copyright © 2016年 张文博. All rights reserved.
//

import UIKit

class PoemTableViewCell: UITableViewCell {

    let poemtextView:UILabel = {
        let textview = UILabel()
        //textview.editable = false
        textview.numberOfLines = 0
        textview.textAlignment = .Center
        textview.font = UIFont(name: AppInfo.Font_CODE_LIGHT, size: 18)
        textview.adjustsFontSizeToFitWidth = true
        return textview
    }()
    
    
    
    func setUI(){
        backgroundColor = UIColor.lightGrayColor()
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(poemtextView)
        self.selectionStyle = .None
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(8, 8, 0, -8))
        }
        
        poemtextView.snp_makeConstraints { (make) in
//            make.top.equalTo(contentView).offset(2)
//            make.left.right.equalTo(contentView)
//            make.centerX.equalTo(contentView)
//            make.bottom.equalTo(contentView).offset(-2)
            make.edges.equalTo(UIEdgeInsetsMake(20, 20, -20, -20))
        }
    }
    
    
    func settext(text:String){
        var str = text
        for var c in str.characters{
            if (c == "，" || c == "。" || c == "；"){
                let i = str.characters.indexOf(c)
                str.removeAtIndex(i!)
                if(i != str.characters.endIndex){
                    str.insert("\n", atIndex: i!)
                }
            }
        }
        self.poemtextView.text = str
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
