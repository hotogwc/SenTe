//
//  ViewController.swift
//  SenTe
//
//  Created by wangchi on 2019/11/26.
//  Copyright © 2019 Zhu xiaojin. All rights reserved.
//

import UIKit
import LLCycleScrollView

class MainViewController: UIViewController {
    
    let imageNames = ["1", "2", "3"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 300))
        // 是否自动滚动
        bannerDemo.autoScroll = true

        bannerDemo.infiniteLoop = true

        // 滚动间隔时间(默认为2秒)
        bannerDemo.autoScrollTimeInterval = 3.0

        // 设置图片显示方式=UIImageView的ContentMode
        bannerDemo.imageViewContentMode = .scaleToFill

        // 设置滚动方向（ vertical || horizontal ）
        bannerDemo.scrollDirection = .horizontal

        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        bannerDemo.customPageControlStyle = .snake

        // 非.system的状态下，设置PageControl的tintColor
        bannerDemo.customPageControlInActiveTintColor = UIColor.red

        // 设置.system系统的UIPageControl当前显示的颜色
        bannerDemo.pageControlCurrentPageColor = UIColor.white

        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerDemo.customPageControlIndicatorPadding = 8.0

        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerDemo.pageControlPosition = .center

        // 背景色
        bannerDemo.collectionViewBackgroundColor = .clear

        // 添加到view
        view.addSubview(bannerDemo)

        bannerDemo.imagePaths = imageNames
    }
}
