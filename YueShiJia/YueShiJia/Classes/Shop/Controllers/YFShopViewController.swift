//
//  YFShopViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/10.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

typealias ShopData = ([YFShopItem],[Banner],[ClassifyItem],Channer)
private let shopHeaderID = "YFShopHeaderView"
private let shopCellID = "YFShopCell"
private let saleCellID = "YFChannerCell"

class YFShopViewController: ViewController {

    //MARK: 定义属性
    var data: ShopData?
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight - kNavigationHeight + 20), style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.register(UINib.init(nibName: saleCellID, bundle: nil), forCellReuseIdentifier: saleCellID)
        tableView.register(UINib.init(nibName: shopCellID, bundle: nil), forCellReuseIdentifier: shopCellID)
        tableView.register(UINib.init(nibName: shopHeaderID, bundle: nil), forHeaderFooterViewReuseIdentifier: shopHeaderID)
        return tableView
    }()

    
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        addTitleView()
        addSearchButton()
        setUI()
        loadData()
    }
}

//MARK: 网络加载
extension YFShopViewController {
    fileprivate func loadData() {
        YFHttpRequest.shareInstance.loadShopData { [weak self] (shopData) in
            self?.data = shopData
            self?.tableView.reloadData()
        }
    }
}

//MARK: 设置UI
extension YFShopViewController {
    fileprivate func setUI() {
        tableView.delegate = self
        tableView.dataSource  = self
        view.addSubview(tableView)
    }
}

//MARK: 方法
extension YFShopViewController {
    
}

//MARK: UITableView代理方法
extension YFShopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = (data?.0.count) ?? -1
        return count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && data!.3.isKind(of: Channer.self) {
            let cell = tableView.dequeueReusableCell(withIdentifier: saleCellID, for: indexPath) as! YFChannerCell
            cell.channer = data?.3
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: shopCellID, for: indexPath) as! YFShopCell
            cell.item = data?.0[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150 * kRate
        } else {
            return 405 * kRate
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = YFSpecialGoodsViewController()
        vc.special_id = data?.0[indexPath.row - 1].special_id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: shopHeaderID) as! YFShopHeaderView
        headerView.bannerItems = data?.1
        headerView.classifyItem = data?.2
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450 * kRate
    }
}

