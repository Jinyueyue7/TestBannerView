//
//  SecondViewController.swift
//  TestTableView
//
//  Created by 金悦悦 on 2018/11/1.
//  Copyright © 2018年 金悦悦. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//    var timer : Timer! = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(autoBanner(_:)), userInfo: nil, repeats: true)
//
//    @objc func autoBanner(_ timer: Timer) -> Void {
//
//        print("定时器")
//
//        let offsetX = collectionView.contentOffset.x
//
//        let index = offsetX / view.frame.width
//
//        if index ==  CGFloat(dataArray.count - 2) {
//
//            collectionView.contentOffset.x = view.frame.width
//
//
//        }else {
//            let currentOffsetX = offsetX + view.frame.width
//            collectionView.contentOffset.x = currentOffsetX
//        }
//    }
    
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
        //是否需要弹簧效果
        collectionView.bounces = false
        collectionView.register(BannerCollectionViewCell.self , forCellWithReuseIdentifier: TestTableViewCell.identifier())
        
        return collectionView
    }()
    
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 170, width: view.frame.width, height: 30))
        
        pageControl.currentPage = 0
        
        pageControl.numberOfPages = 3
        
        pageControl.pageIndicatorTintColor = .blue
        pageControl.currentPageIndicatorTintColor = .orange
        
        return pageControl
    }()
    
    private lazy var dataArray : [String] = ["tu3","tu1","tu2","tu3","tu1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        self.edgesForExtendedLayout = []
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        //设置初始图片
        let indexPath = IndexPath(item: 1, section: 0) as NSIndexPath
        collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        
        //设置定时器
        setTimer()
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
    
    //滑动图片切换
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        
        let index = offsetX / view.frame.width

        var currentIndex = 0

        //第一页往前滑跳转到最后一页
        if index == 0 {
            let indexPath = IndexPath(item: dataArray.count - 2, section: 0) as NSIndexPath
            
            currentIndex = dataArray.count - 2
            
            collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }else if index == CGFloat(dataArray.count - 1) {
            //最后一页往后滑跳转到第一页
            let indexPath = IndexPath(item: 1, section: 0) as NSIndexPath
            
            currentIndex = 0
            
            collectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }else {
            
            print(index)
            print(round(index))
            print("-----")

            let roundIndex = round(index)
            
               currentIndex = Int(roundIndex) - 1
        }
        pageControl.currentPage = currentIndex
    }
}

extension SecondViewController {
    
    func setTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            let offsetX = self.collectionView.contentOffset.x
            
            let index = offsetX / self.view.frame.width
            
            if index ==  CGFloat(self.dataArray.count - 2) {
                
                self.collectionView.contentOffset.x = self.view.frame.width
                
                
            }else {
                let currentOffsetX = offsetX + self.view.frame.width
                self.collectionView.contentOffset.x = currentOffsetX
            }
        }
    }
    
}
