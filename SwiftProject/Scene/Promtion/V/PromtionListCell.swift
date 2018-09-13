//
//  PromtionListCell.swift
//  SwiftProject
//
//  Created by Ric on 18/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class PromtionListCell: UITableViewCell {
    
    var titleLB:UILabel = UILabel()
    var icon:UIImageView = UIImageView()
    var subTitleLB:UILabel = UILabel()
    var imgView:UIImageView = UIImageView()
    var detailLB:UILabel = UILabel()
    var indicator:UIImageView = UIImageView()
    
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
        
        let bg:UIView = UIView.init(frame: CGRect(x: 12, y: 10, width: kScreenWidth-24, height: 220))
        bg.backgroundColor = kMainBgColor
        self.contentView.addSubview(bg)
        
        icon = UIImageView.init(frame: CGRect(x: 22, y: 20, width: 50, height: 20))
        self.contentView.addSubview(icon)
        self.contentView.addSubview(icon)
        
        titleLB = UILabel.init(frame: CGRect(x: icon.right+10, y: 20, width: kScreenWidth-102, height: 20))
        titleLB.font = UIFont.systemFont(ofSize:12)
        titleLB.textColor = kMainTitleColor
        self.contentView.addSubview(titleLB)
        
        imgView = UIImageView.init(frame:CGRect(x:22, y:titleLB.bottom+10, width:kScreenWidth-44, height:100));
        imgView.isUserInteractionEnabled = true
        self.contentView.addSubview(imgView)
        
        subTitleLB = UILabel.init(frame: CGRect(x: 22, y: imgView.bottom+10, width: kScreenWidth-44, height: 20))
        subTitleLB.font = UIFont.systemFont(ofSize:12)
        subTitleLB.textColor = .white
        self.contentView.addSubview(subTitleLB)
        
        
        let line:UIView = UIView.init(frame: CGRect(x:22, y:subTitleLB.bottom+10, width:kScreenWidth-44, height:1))
        line.backgroundColor = kLineColor;
        self.contentView.addSubview(line)
        
        detailLB = UILabel.init(frame: CGRect(x:22, y:line.bottom+10,width: kScreenWidth-64, height:20))
        detailLB.font = UIFont.systemFont(ofSize:12)
        detailLB.text = "点击查看更多详情";
        detailLB.textColor = kMainTitleColor;
        self.contentView.addSubview(detailLB)
        
        indicator = UIImageView.init(frame:CGRect(x:kScreenWidth-32, y:line.bottom+12, width:10, height:15))
        indicator.image = UIImage.init(named:"preferential_icon_more")
        self.contentView.addSubview(indicator)
    }

}
