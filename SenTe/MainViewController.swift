//
//  ViewController.swift
//  SenTe
//
//  Created by wangchi on 2019/11/26.
//  Copyright © 2019 Zhu xiaojin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(carouselView)
        handleSubViews()
    }
    
    var carouselView = CarouselView()
    
    func handleSubViews(){
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        carouselView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

}

