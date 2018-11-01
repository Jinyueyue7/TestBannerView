//
//  TestTableViewCell.swift
//  TestTableView
//
//  Created by 金悦悦 on 2018/11/1.
//  Copyright © 2018年 金悦悦. All rights reserved.
//

import UIKit

typealias myClosureType = (String) -> Void

class TestTableViewCell: UITableViewCell {
    
   
    var backClosure:myClosureType?           //接收上个页面穿过来的闭包块
    
    
    private lazy var imageV = UIImageView()
    private lazy var label = UILabel()
    private lazy var btn : UIButton = { //() -> UIButton in
        let btn = UIButton(type: .custom)
        btn.setTitle("按钮", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(self.btnClick(btn:)), for: .touchUpInside)
        
        btn.backgroundColor = UIColor.red
        
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.accessoryType = .none
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(imageV)
        contentView.addSubview(label)
        contentView.addSubview(btn)
        
        imageV.backgroundColor = UIColor.yellow
        label.text = "测试";
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    override func layoutSubviews() {
        imageV.frame = CGRect(x: 0, y: 0, width: 20, height: self.frame.height)
        label.frame = CGRect(x: imageV.frame.maxX, y: 0, width: 100, height: self.frame.height)
        btn.frame = CGRect(x: label.frame.maxX, y: 0, width: self.frame.width - label.frame.maxX, height: self.frame.height)
    }
    
    func setBackMyClosure(tempClosure:@escaping myClosureType) {
        self.backClosure = tempClosure
    }
    
    func hahaha() {
        print("hahaha")
    }
    
   //获取identifier
   public class func identifier() -> String {
    let name : AnyClass! = object_getClass(self)
    
    return NSStringFromClass(name)
    }
}

extension TestTableViewCell {
    @objc func btnClick(btn: UIButton) {
        print("按钮点击")
        
        if self.backClosure != nil {
            let tempString:String? = btn.titleLabel?.text
            
            if tempString != nil {
                self.backClosure!(tempString!)
            }
            
        }
        
    }
}

extension TestTableViewCell {
    
}
