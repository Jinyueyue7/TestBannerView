//
//  ViewController.swift
//  TestTableView
//
//  Created by 金悦悦 on 2018/11/1.
//  Copyright © 2018年 金悦悦. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier())
        tableView.rowHeight = 30
        
        return tableView
    }()
    
    private lazy var dataArray : [String] = ["测试1","测试2","测试3","测试4","测试5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier(), for: indexPath) as! TestTableViewCell
        
        cell.setBackMyClosure { (text) in
            print(text)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        let secVC = SecondViewController()
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
}

