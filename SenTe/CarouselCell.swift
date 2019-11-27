//
//  CarouselCell.swift
//  SenTe
//
//  Created by Wang, Chi on 2019/11/27.
//  Copyright © 2019 Zhu xiaojin. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var isInited = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isInited {
            isInited = true
            contentView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
    }
    
    func configure(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}
