//
//  YFSubjectViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/10.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFSubjectViewController: ViewController {

    //MARK: 定义属性
    //titleView
    fileprivate var titleView: YFSubjectHeaderView?
    //标题数组
    fileprivate var titleItems = ["视频","榜单","地图","知识","人文","活动"]
    
    //滑动scrollView
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: kNavigationHeight + kSubjectHeaderHeight, width: kWidth, height: kHeight - kNavigationHeight - kSubjectHeaderHeight - kToolBarHeight))
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.green
        return scrollView
    }()

    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleView()
        addSearchButton()
        setNavigationSep()
        setUI()
        setController()
    }
}

//MARK: 网络加载
extension YFSubjectViewController {
    
}

//MARK: 设置UI
extension YFSubjectViewController {
    ///设置ui
    fileprivate func setUI() {
        automaticallyAdjustsScrollViewInsets = false
        //1.设置scrollView
        scrollView.delegate = self
        view.addSubview(scrollView)
        //2.设置分类
        titleView = YFSubjectHeaderView(frame: CGRect(x: 0, y: kNavigationHeight, width: kWidth, height: kSubjectHeaderHeight), titleItems: titleItems)
        titleView?.delegate = self
        view.addSubview(titleView!)
    }
    fileprivate func setController() {
        //设置控制器
        var vcArray = [UIViewController]()
        var i: CGFloat = 0
        for _ in titleItems {
            let vc = YFSubViewController()
            switch Int(i) {
            case 0:
                vc.special_type = "1"
                break
            case 1:
                vc.special_type = "2"
                break
            case 2:
                vc.special_type = "5"
                break
            case 3:
                vc.special_type = "3"
                break
            case 4:
                vc.special_type = "4"
                break
            case 5:
                vc.special_type = "6"
                break
            default:
                break
            }
            vcArray.append(vc)
            //添加到scrollView上
            vc.view.frame = CGRect(x: i * kWidth, y: 0, width: kWidth, height: kHeight - kNavigationHeight - kSubjectHeaderHeight - kToolBarHeight)
            vc.view.backgroundColor = UIColor.white
            scrollView.addSubview(vc.view)
            addChildViewController(vc)
            i += 1
        }
        //设置scrollView的contentOffset
        scrollView.contentSize = CGSize(width: kWidth * CGFloat(vcArray.count), height: 0)
    }

}

//MARK: 方法
extension YFSubjectViewController {
    
}


//MARK: scrollView代理方法
extension YFSubjectViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / kWidth;
        self.titleView?.moveSelectedTitle(Int(index))
    }
}


//MARK: titleView代理方法
extension YFSubjectViewController: YFSubjectHeaderViewDelegate {
    func selectedTitle(_ index: Int) {
        scrollView.setContentOffset(CGPoint(x: CGFloat(index) * kWidth, y: 0), animated: false)
    }
}

