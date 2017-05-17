//
//  YFHomeViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/10.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import MJRefresh

private let typeOneCell = "YFHomeTypeOneCell"

private let typeTwoCell = "YFHomeTypeTwoCell"

private let typeThreeCell = "YFHomeTypeThreeCell"

private let headView = "YFHomeHeaderView"

class YFHomeViewController: ViewController {

    //MARK: 定义属性
    
    /// 页数
    var page: Int = 1
    
    /// 广告
    var banners = [Banner]()
    
    /// 产品数组
    var items = [YFHomeItem]()
    
    /// 类别
    var headItems = [YFHomeHeaderItem]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight - kNavigationHeight), style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        tableView.register(UINib.init(nibName: typeOneCell, bundle: nil), forCellReuseIdentifier: typeOneCell)
        tableView.register(UINib.init(nibName: typeTwoCell, bundle: nil), forCellReuseIdentifier: typeTwoCell)
        tableView.register(UINib.init(nibName: typeThreeCell, bundle: nil), forCellReuseIdentifier: typeThreeCell)
        tableView.register(UINib.init(nibName: headView, bundle: nil), forHeaderFooterViewReuseIdentifier: headView)
        return tableView
    }()
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
}

//MARK: 网络加载
extension YFHomeViewController {
    fileprivate func loadData() {
        YFHttpRequest.shareInstance.loadHomeData(page) { [weak self] (result) in
            self?.banners = result.1
            self?.items = result.0
            self?.headItems = result.2
            self?.tableView.reloadData()
        }
    }
}

//MARK: 设置UI
extension YFHomeViewController {
    fileprivate func setUI() {
        addTitleView()
        addSearchButton()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

//MARK: 方法
extension YFHomeViewController {
    
}

//MARK: UITableView代理方法
extension YFHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch items[indexPath.row].relation_object_type! {
        case "4":
            let cell = tableView.dequeueReusableCell(withIdentifier: typeOneCell, for: indexPath) as! YFHomeTypeOneCell
            cell.homeItem = items[indexPath.row]
            cell.delegate = self
            return cell
        case "6":
            let cell = tableView.dequeueReusableCell(withIdentifier: typeTwoCell, for: indexPath) as! YFHomeTypeTwoCell
            cell.item = items[indexPath.row]
            return cell
        case "2":
            let cell = tableView.dequeueReusableCell(withIdentifier: typeThreeCell, for: indexPath) as! YFHomeTypeThreeCell
            cell.item = items[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headView) as! YFHomeHeaderView
        headerView.delegate = self
        headerView.imageItems = banners
        headerView.fourItems = headItems
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row].relation_object_type! == "4" {
            let vc = YFSpecialGoodsViewController()
            vc.special_id = items[indexPath.row].relation_object_id
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 310 * kRate
    }
}

//MARK: YFHomeHeaderViewDelegate
extension YFHomeViewController: YFHomeHeaderViewDelegate {
    func advertiseSelected(_ index: Int) {
        let vc = YFAdvetiseViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension YFHomeViewController: YFHomeTypeOneCellDelegate {
    func seletcedSpecialGood(_ Index: Int) {
        print("nihao")
    }
}
