//
//  SignItem.swift
//  SwiftProject
//
//  Created by Ric on 27/9/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class SignItem: UIControl {

    var bgImg:UIImageView = UIImageView()
    var icon:UIImageView = UIImageView()
    var titleLB:UILabel = UILabel()
    var badgeIcon:UIImageView = UIImageView()
    var badgeLB:UILabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initSubViews(){
        
        bgImg = UIImageView.init(frame: CGRect(x: 0, y: 0, width: GetScaleWidthIphone5(53), height: GetScaleWidthIphone5(60)))
        self.addSubview(bgImg)
        
        icon = UIImageView.init(frame: CGRect(x: GetScaleWidthIphone5(6.5), y: GetScaleWidthIphone5(5), width: GetScaleWidthIphone5(40), height: GetScaleWidthIphone5(40)))
        self.addSubview(icon)
        
        titleLB = UILabel.init(frame: CGRect(x: 0, y: icon.bottom, width: GetScaleWidthIphone5(53), height: GetScaleWidthIphone5(15)))
        titleLB.font = UIFont.systemFont(ofSize: 10)
        titleLB.textColor = UIColor.white
        titleLB.textAlignment = NSTextAlignment.center
        self.addSubview(titleLB)
        
        badgeIcon = UIImageView.init(frame: CGRect(x: GetScaleWidthIphone5(33), y: 0, width: GetScaleWidthIphone5(20), height: GetScaleWidthIphone5(20)))
        badgeIcon.image = UIImage.init(named: "signin_png_label")
        self.addSubview(badgeIcon)
        
        badgeLB = UILabel.init(frame: CGRect(x: GetScaleWidthIphone5(30), y: GetScaleWidthIphone5(-2), width: GetScaleWidthIphone5(30), height: GetScaleWidthIphone5(15)))
        badgeLB.font = UIFont.systemFont(ofSize: 8)
        badgeLB.textColor = UIColor.white
        badgeLB.textAlignment = NSTextAlignment.center
        badgeLB.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
        self.addSubview(badgeLB)
        
    }
}
