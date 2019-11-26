//
//  CarouselView.swift
//  SenTe
//
//  Created by wangchi on 2019/11/26.
//  Copyright © 2019 Zhu xiaojin. All rights reserved.
//

import UIKit

class CarouselView: UIView, UIScrollViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        self.backgroundColor = UIColor.white
        self.addSubview(scrollView)
        self.addSubview(pageControl)
        self.setupTimer()
    }
    
    private var myTimer:Timer?
    private var mycurrentPage = 1
    let imgArr = ["1","2","3"]
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        scrollView.contentSize = CGSize(width: CGFloat(imgArr.count)*(UIScreen.main.bounds.width), height: 200)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.red
        scrollView.delegate = self
        
        for i in 0..<imgArr.count {
            let imgView = UIImageView(frame: CGRect(x: i*Int(UIScreen.main.bounds.width), y: 0, width: Int(UIScreen.main.bounds.width), height: 200))
            scrollView.addSubview(imgView)
            imgView.image = UIImage(named: imgArr[i])
        }
        return scrollView
    }()
    
    private lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: (UIScreen.main.bounds.width)/2 - 50, y: 170, width: 50, height: 10))
        pageControl.currentPage = 0
        pageControl.numberOfPages = imgArr.count
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.blue
        return pageControl
    }()
    
    func setupTimer() {
        self.myTimer = Timer.init(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.main.add(self.myTimer!, forMode: RunLoop.Mode.default)
    }
    
    func closeTimer(){
        self.myTimer?.invalidate()
        self.myTimer = nil
    }
    
    @objc func timerAction(){
        self.pageControl.currentPage += mycurrentPage
        
        if self.pageControl.currentPage == (imgArr.count ) {
            self.pageControl.currentPage = 0
        }
        self.scrollView.contentOffset = CGPoint(x:CGFloat(UIScreen.main.bounds.width)*CGFloat((pageControl.currentPage)),y:0)
    }
    internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
        self.pageControl.currentPage = page
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.closeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.setupTimer()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x/UIScreen.main.bounds.width)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

