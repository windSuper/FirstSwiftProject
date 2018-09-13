//
//  WebsiteListCellTableViewCell.swift
//  SwiftProject
//
//  Created by Ric on 12/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class WebsiteListCell: UITableViewCell {

    
    var icon = UIImageView();
    var unreadIcon = UIImageView();
    var titleLB = UILabel();
    var dateLB = UILabel();
    var indicator = UIImageView();
    
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
        icon = UIImageView.init(frame: CGRect(x: 12, y: 15, width: 20, height: 20))
        self.contentView.addSubview(icon)
        
        unreadIcon = UIImageView.init(frame: CGRect(x: 28, y: 11, width: 8, height: 8))
        self.contentView.addSubview(unreadIcon)
        
        indicator = UIImageView.init(frame: CGRect(x: kScreenWidth-22, y: 17, width: 10, height: 15))
        indicator.image = UIImage.init(named: "list_next")
        self.contentView.addSubview(indicator)
        
        titleLB = UILabel.init(frame: CGRect(x: icon.right+10, y: 15, width: kScreenWidth-180, height: 20))
        titleLB.textColor = UIColor.white
        titleLB.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(titleLB)
        
        dateLB = UILabel.init(frame: CGRect(x: titleLB.right+10, y: 15, width: 100, height: 20))
        dateLB.textColor = kPlaceHolderColor
        dateLB.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(dateLB)
    }
}
