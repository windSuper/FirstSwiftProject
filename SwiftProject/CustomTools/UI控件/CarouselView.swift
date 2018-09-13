//
//  CarouselView.swift
//  SwiftProject
//
//  Created by Ric on 2/10/17.
//  Copyright © 2017年 Ric. All rights reserved.
//

import UIKit
import Kingfisher

//MARK:- 代理协议
public protocol CarouselDelegate : NSObjectProtocol{
    
    func selectedCarouselIndex(index:Int)
    
}

class CarouselView: UIView,UIScrollViewDelegate {

    //MARK:- 属性声明
    
    private var timer:Timer?
    private var contentView:UIScrollView = UIScrollView()
    private var pageControl:UIPageControl = UIPageControl()
    private var leftImageView:UIImageView = UIImageView()
    private var middleImageView:UIImageView = UIImageView()
    private var rightImageView:UIImageView = UIImageView()
    weak open var delegate: CarouselDelegate?
    
    
    //MARK:- 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.white
        self.initScrollView()
        self.initPageControl()
        self.initImageView()
        self.initTimer()
        self.addContentOffsetObserver()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
        self.removeContentOffsetObserver()
    }
    
    //MARK:- 子视图
    
    func initScrollView(){
        contentView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        contentView.contentSize = CGSize(width: self.frame.size.width*3, height: 0)
        contentView.isPagingEnabled = true
        contentView.showsHorizontalScrollIndicator = false
        contentView.delegate=self
        self.addSubview(contentView)
        self.setScrollContentOffsetCenter()
    
    }
    
    func initPageControl(){
        pageControl = UIPageControl.init(frame: CGRect(x: 0, y: self.frame.size.height-30, width: self.frame.size.width, height: 30))
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.isUserInteractionEnabled = false
        self.addSubview(pageControl)
    }
    
    func initImageView(){
        leftImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        
        middleImageView = UIImageView.init(frame: CGRect(x: self.frame.size.width*1, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        middleImageView.isUserInteractionEnabled = true
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapCarouselAction))
        middleImageView.addGestureRecognizer(gesture)
        
        rightImageView = UIImageView.init(frame: CGRect(x: self.frame.size.width*2, y: 0, width: self.frame.size.width, height: self.frame.size.height))
    }
    
    //MARK:- 定时器
    
    func initTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(pageScrollAction), userInfo: nil, repeats: true)
    }
    
    
    //MARK:- scroll代理
    func setScrollContentOffsetCenter(){
        contentView.contentOffset = CGPoint(x: self.frame.size.width, y: 0)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        let count = self.imagesArr.count
        if count>1 {
            timer?.fireDate = NSDate.distantFuture
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     
        let count = self.imagesArr.count
        if count>1 {
            timer?.fireDate = NSDate.init(timeIntervalSinceNow: 3.0) as Date
        }
        
        
    }
    
    //MARK:- 属性Set方法
    var imagesArr:[String] = []{
        didSet{
            
            if (imagesArr.count==0) {return}
            
            self.currentIndex = 0;
            contentView.addSubview(leftImageView)
            contentView.addSubview(middleImageView)
            contentView.addSubview(rightImageView)
            
            if imagesArr.count>1 {
                // auto scroll
                timer?.fireDate = NSDate.init(timeIntervalSinceNow: 3.0) as Date
                pageControl.numberOfPages = imagesArr.count;
                pageControl.currentPage = 0;
                pageControl.isHidden = false;
            } else {
                pageControl.isHidden = true;
                self.leftImageView.removeFromSuperview()
                self.rightImageView.removeFromSuperview()
                self.contentView.contentSize = CGSize(width:self.frame.size.width,height:0);
            }
            
        }
        
    }
    
    private var currentIndex:Int=0{
        didSet{
            // caculate index
            let imageCount:Int = self.imagesArr.count;
            if imageCount == 0 {return}
            let leftIndex:Int = (currentIndex + imageCount - 1) % imageCount;
            let rightIndex:Int = (currentIndex + 1) % imageCount;
            
            // fill image
            let leftUrl = URL(string: imagesArr[leftIndex])
            self.leftImageView.kf.setImage(with: leftUrl)
            
            let currentUrl = URL(string: imagesArr[currentIndex])
            self.middleImageView.kf.setImage(with: currentUrl)
            
            let rightUrl = URL(string: imagesArr[rightIndex])
            self.rightImageView.kf.setImage(with: rightUrl)
            
            
            // 每次滚动后，都需要将当前页移动到中间位置
            self.setScrollContentOffsetCenter();
            
            self.pageControl.currentPage = currentIndex;
        }
        
    }
    
    //MARK:- 观察者
    
    func addContentOffsetObserver(){
        self.contentView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    func removeContentOffsetObserver(){
        self.contentView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentOffset"){
            self.caculateCurrentIndex()
        }
    }
    
    //MARK:- 定时器响应方法
    
    func pageScrollAction(){
        
        // 矫正imageView的frame：因为定时器的自动滚动，可能导致轮播图一页显示两张图片的情况
        let criticalValue:CGFloat = 0.2
        if (self.contentView.contentOffset.x < self.frame.size.width - criticalValue || self.contentView.contentOffset.x > self.frame.size.width + criticalValue) {
            self.setScrollContentOffsetCenter()
        }
        let newOffset:CGPoint = CGPoint(x:self.contentView.contentOffset.x+self.frame.size.width, y: 0)
        self.contentView.setContentOffset(newOffset,animated:true);
        
    }
    
    //MARK:- 计算便宜量
    func caculateCurrentIndex(){
        if (imagesArr.count) > 0{
            
            let pointX:CGFloat = self.contentView.contentOffset.x;
            // 临界值判断，第一个和第三个imageView的contentoffset
            let criticalValue:CGFloat = 0.2
            // 向右滑动，右侧临界值的判断
            if (pointX > 2 * self.frame.size.width - criticalValue) {
                self.currentIndex = (self.currentIndex + 1) % self.imagesArr.count;
            } else if (pointX < criticalValue) {// 向左滑动，左侧临界值的判断
                self.currentIndex = (self.currentIndex + self.imagesArr.count - 1) % self.imagesArr.count;
            }
        }
        
    }
    
    func tapCarouselAction(){
        if self.delegate != nil {
            
            self.delegate!.selectedCarouselIndex(index: currentIndex)
        }
    }
    
}
