//
//  BannerCollectionViewCell.swift
//  TestTableView
//
//  Created by 金悦悦 on 2018/11/1.
//  Copyright © 2018年 金悦悦. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var imageName : String? {
        didSet {
            imageV.image = UIImage(named: imageName ?? "")
        }
    }
    
    private lazy var imageV : UIImageView = {
        let imageV = UIImageView(frame: self.bounds)
        
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.addSubview(imageV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
