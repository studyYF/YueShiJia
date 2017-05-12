//
//  ViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/9.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    /// 添加titleView
    func addTitleView() {
        let imageView = UIImageView(frame:  CGRect(x: 0, y: 0, width: 60, height: 20))
        imageView.image = UIImage(named: "YS_food+")
        navigationItem.titleView = imageView
    }
    
    /// 添加搜索按钮
    func addSearchButton() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setImage(UIImage(named: "icon_home_search_index"), for: .normal)
        button.addTarget(self, action: #selector(ViewController.searchAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }

}

extension ViewController {
    @objc fileprivate func searchAction() {
        print("搜索")
    }
}

