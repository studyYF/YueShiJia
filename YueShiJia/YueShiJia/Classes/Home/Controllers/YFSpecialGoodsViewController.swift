//
//  YFSpecialGoodsViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/15.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

private let cellID = "YFSpecailGoodsCell"

private let headerID = "YFSpecialGoodsHeaderView"

class YFSpecialGoodsViewController: UIViewController {

    //MARK: 定义属性
    var special_id: String?
    
    var item: YFSpecialGoodsItem?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight), style: .grouped)
        tableView.register(UINib.init(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib.init(nibName: headerID, bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 400
        return tableView
    }()
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor.clear)
        loadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNav()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
    }
}

//MARK: 网络加载
extension YFSpecialGoodsViewController {
    func loadData() {
        YFHttpRequest.shareInstance.loadSpecialGoodsData(special_id!) { [weak self] (item) in
            self?.item = item
            self?.setUI()
        }
    }
}

//MARK: 设置UI
extension YFSpecialGoodsViewController {
    fileprivate func setUI() {
        //2.设置tableView
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        scrollViewDidScroll(self.tableView)
        //3.设置title
        title = item?.special_title
    }
    
    fileprivate func setNav() {
        //1.设置导航栏颜色渐变效果
        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor.clear)
        //2.导航栏按钮
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: UIButton(imageName: "article_share")), UIBarButtonItem(customView: UIButton(imageName: "pool_se"))]
    }
}

//MARK: 方法
extension YFSpecialGoodsViewController {
    
}

//MARK: UITableView代理方法
extension YFSpecialGoodsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let item = item {
            return (item.news_special![1].goods_list?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! YFSpecailGoodsCell
        cell.item = item?.news_special?[1].goods_list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 385 * kRate
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! YFSpecialGoodsHeaderView
        headerView.imgvUrl = item?.special_image
        headerView.text = item?.special_stitle
        return headerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let color = UIColor.white
        if scrollView.contentOffset.y > 50 {
            let alpha = 1 - (50 + 64 - scrollView.contentOffset.y) / 64
            navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(min(1, alpha)))
            navigationController?.navigationItem.titleView?.alpha = min(1, alpha)
        } else {
            navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(0))
            navigationController?.navigationItem.titleView?.alpha = 0
        }
    }
}

