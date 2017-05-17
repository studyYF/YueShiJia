//
//  YFNavigationController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/10.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFNavigationController: UINavigationController {

    //MARK: 定义属性
    
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.isTranslucent = false
//        navigationBar.setBackgroundImage(UIImage.imageWithColor(color: UIColor.white), for: .default)
        navigationBar.barTintColor = UIColor.white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationItem.hidesBackButton = true
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            button.setImage(UIImage(named: "nav_return_normal"), for: .normal)
            button.addTarget(self, action: #selector(YFNavigationController.back), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc private func back() {
        popViewController(animated: true)
    }
    
}




