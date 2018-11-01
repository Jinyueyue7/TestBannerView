//
//  SecondViewController.swift
//  TestTableView
//
//  Created by 金悦悦 on 2018/11/1.
//  Copyright © 2018年 金悦悦. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: 200)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BannerCollectionViewCell.self , forCellWithReuseIdentifier: TestTableViewCell.identifier())
        
        return collectionView
    }()
    
    private lazy var dataArray : [String] = ["tu3","tu1","tu2","tu3","tu1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        view.backgroundColor = UIColor.cyan
        
        view.addSubview(collectionView)
        
    }
}

extension SecondViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dataArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestTableViewCell.identifier(), for: indexPath) as! BannerCollectionViewCell
        
        
        cell.imageName = dataArray[indexPath.row]
        
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        
        let index = offsetX / view.frame.width
        
        if index == 0 {
            let indexPath = IndexPath(item: dataArray.count - 2, section: 0) as NSIndexPath
            
            collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }
        
        if index == CGFloat(dataArray.count - 1) {
            let indexPath = IndexPath(item: 1, section: 0) as NSIndexPath
            
            collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }
    }
    
}
