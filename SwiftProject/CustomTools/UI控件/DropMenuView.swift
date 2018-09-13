//
//  DropMenuView.swift
//  SwiftProject
//
//  Created by Ric on 19/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit


//MARK:- 代理协议
public protocol DropMenuDelegate : NSObjectProtocol{
    
    func selectedMenuIndex(index:Int)
    
}

class DropMenuView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var title:String = "请选择"
    var titleColor:UIColor = UIColor.white
    var rowH:CGFloat = 30
    var tArr:NSArray = []
    
    var arrowView:UIImageView = UIImageView()
    private var mainBtn:UIButton = UIButton()
    private var listView:UIView = UIView()
    private var infoTable:UITableView = UITableView()
    weak open var delegate: DropMenuDelegate?
    
    
    init(frame:CGRect, titleArr:NSArray,rowHeight:CGFloat){
        super.init(frame: frame)
        rowH = rowHeight
        tArr = titleArr
        self.initSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubview(){
        mainBtn = UIButton.init(frame: self.bounds)
        mainBtn.setTitleColor(titleColor, for: .normal)
        mainBtn.contentHorizontalAlignment = .left
        mainBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        mainBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        mainBtn.isSelected = false
        mainBtn.setTitle(title, for: .normal)
        mainBtn.backgroundColor = .clear
        mainBtn.layer.borderColor = UIColor.black.cgColor
        mainBtn.addTarget(self, action: #selector(clickMainBtn(btn:)), for: .touchUpInside)
        mainBtn.layer.borderWidth = 1
        self.addSubview(mainBtn)
        
        arrowView = UIImageView.init(frame: CGRect(x: mainBtn.frame.size.width-21, y: (mainBtn.frame.size.height-10)/2, width: 15, height: 10))
        arrowView.image = UIImage.init(named: "preferential_icon")
        mainBtn.addSubview(arrowView)
        
        self.initMenuTable()
    }
    
    func initMenuTable(){
        listView = UIView.init(frame: CGRect(x: self.left, y: self.bottom, width: self.width, height: 0))
        listView.layer.borderColor = UIColor.lightText.cgColor
        listView.layer.borderWidth = 0.5
        listView.layer.masksToBounds = false
        listView.clipsToBounds = true
        
        infoTable = UITableView.init(frame: CGRect(x: 0, y: 0, width: listView.width, height: listView.height), style: .plain)
        infoTable.delegate = self
        infoTable.dataSource = self
        infoTable.bounces = false
        infoTable.separatorStyle = .none
        infoTable.backgroundColor = .black
        listView.addSubview(infoTable)
    }
    
    func clickMainBtn(btn:UIButton){
        self.superview?.addSubview(listView)
        if btn.isSelected == false{
            self.showMenu()
        }else{
            self.hiddenMenu()
        }
    }
    
    func showMenu(){
        listView.superview?.bringSubview(toFront: listView)
        UIView.animate(withDuration: 0.25, animations: { 
            
            self.arrowView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.listView.height = CGFloat(self.tArr.count) * self.rowH
            self.infoTable.height = self.listView.height
        }) { (finish) in
            
        }
        mainBtn.isSelected = true
    }
    
    func hiddenMenu(){
        UIView.animate(withDuration: 0.25, animations: {
            
            self.arrowView.transform = CGAffineTransform.identity
            self.listView.height = 0
            self.infoTable.height = self.listView.height
        }) { (finish) in
            
        }
        mainBtn.isSelected = false
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowH
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "dropMenuCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
            cell?.backgroundColor = .clear
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 11)
            cell?.textLabel?.textColor = titleColor
            cell?.selectionStyle = .none
            
            let line = UIView.init(frame: CGRect(x: 0, y: rowH-0.5, width: self.width, height: 0.5))
            line.backgroundColor = UIColor.lightGray
            cell?.addSubview(line)
        }
        cell?.textLabel?.text = tArr[indexPath.row] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainBtn.setTitle(tArr[indexPath.row] as? String, for: .normal)
        delegate?.selectedMenuIndex(index: indexPath.row)
        self.hiddenMenu()
    }
}
