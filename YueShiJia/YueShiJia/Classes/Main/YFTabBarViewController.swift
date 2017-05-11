//
//  YFTabBarViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/10.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFTabBarViewController: UITabBarController {

    //MARK: 定义属性
    
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tabBar.isTranslucent = false
        addChildVC(vc: YFHomeViewController(), title: "首页", image: "YS_index_nor", selImage: "YS_index_sel", tag: 100)
        addChildVC(vc: YFSubjectViewController(), title: "专题", image: "YS_pro_nor", selImage: "YS_pro_sel", tag: 101)
        addChildVC(vc: YFShopViewController(), title: "店铺", image: "YS_shop_nor", selImage: "YS_shop_sel", tag: 102)
        addChildVC(vc: YFBasketViewController(), title: "购物篮", image: "YS_car_nor", selImage: "YS_car_sel", tag: 103)
        addChildVC(vc: YFProfileViewController(), title: "我", image: "YS_mine_nor", selImage: "YS_mine_sel", tag: 104)
    }
    
    
}


//MARK: 设置UI
extension YFTabBarViewController {
    fileprivate func addChildVC(vc: UIViewController, title: String, image: String,selImage: String,tag: Int) {
        vc.tabBarItem.title = title
        vc.tabBarItem.tag = tag
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selImage)
        addChildViewController(YFNavigationController(rootViewController: vc))
    }
}


// MARK: - UITabBarControllerDelegate
extension YFTabBarViewController: UITabBarControllerDelegate {
    //获取选中的UITabBarButton，并添加图片动画
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        var view = tabBar.subviews[item.tag - 99]
        if !view.isKind(of: NSClassFromString("UITabBarButton")!) {
            view = tabBar.subviews[item.tag - 99 + 1]
        }
        for imageView in view.subviews {
            //添加关键帧动画
            if imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!) {
                let keyAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
                keyAnimation.values = [1.0,1.3,0.9,1.15,0.95,1.02,1.0]
                keyAnimation.duration = 0.8
                keyAnimation.calculationMode = kCAAnimationCubic
                imageView.layer.add(keyAnimation, forKey: "transform.scale")
            }
        }
    }
}


