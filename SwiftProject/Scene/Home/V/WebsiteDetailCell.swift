//
//  WebsiteDetailCell.swift
//  SwiftProject
//
//  Created by Ric on 16/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class WebsiteDetailCell: UITableViewCell {

    var icon = UIImageView();
    private var bgImageView = UIImageView();
    
    var titleLB = UILabel();
    var subTitleLB = UILabel();
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews(){
        icon = UIImageView.init(frame: CGRect(x: 12, y: 10, width: 40, height: 40))
        self.contentView.addSubview(icon)
        
        bgImageView = UIImageView.init(frame: CGRect(x: icon.right, y: 10, width: kScreenWidth-70, height: 80))
        bgImageView.image = UIImage.init(named: "email_input")
        self.contentView.addSubview(bgImageView)
        
        titleLB = UILabel.init(frame: CGRect(x: 22, y: 10, width: kScreenWidth-114, height: 20))
        titleLB.textColor = kMainTitleColor
        titleLB.font = UIFont.systemFont(ofSize: 14)
        bgImageView.addSubview(titleLB)
        
        subTitleLB = UILabel.init(frame: CGRect(x: 22, y: titleLB.bottom+5, width: kScreenWidth-114, height: 40))
        subTitleLB.numberOfLines = 0
        subTitleLB.textColor = kPlaceHolderColor
        subTitleLB.font = UIFont.systemFont(ofSize: 14)
        bgImageView.addSubview(subTitleLB)
        
    }
    override func layoutSubviews() {
        var height = CalculateTextHeight(text: subTitleLB.text!, LBWidth: kScreenWidth-60, fontSize: 13)
        height = height > 40 ? height : 40
        subTitleLB.height = height
        bgImageView.height = self.height-20
    }
}

