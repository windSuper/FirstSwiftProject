//
//  GameCell.swift
//  SwiftProject
//
//  Created by Ric on 17/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    private var icon:UIImageView=UIImageView()
    private var titleLB:UILabel=UILabel()
    private var startBtn:UIButton=UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubView(){
        icon = UIImageView.init(frame: CGRect(x: 0, y: 10, width: 60, height: 60))
        icon.backgroundColor = .clear
        icon.isUserInteractionEnabled = true
        self.contentView.addSubview(icon)
        
        titleLB = UILabel.init(frame: CGRect(x: 0, y: icon.bottom+5, width: 60, height: 20))
        titleLB.textColor = .white
        titleLB.textAlignment = .center
        titleLB.font = UIFont.systemFont(ofSize: 10)
        self.contentView.addSubview(titleLB)
        
        startBtn = UIButton.init(frame: CGRect(x: 0, y: titleLB.bottom+5, width: 60, height: 20))
        startBtn.isUserInteractionEnabled = false
        startBtn.setTitle("立即游戏", for: .normal)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        startBtn.setBackgroundImage(UIImage.init(named: "game_lost_but"), for: .normal)
        self.contentView.addSubview(startBtn)
    }
    
    var model:GameModel=GameModel(){
        didSet{
            let host:String = UserDefaults.standard.object(forKey: "Host") as! String
            titleLB.text = model.game_title
            icon.kf.setImage(with: URL.init(string: host+model.img_url))
        }
    }
}
