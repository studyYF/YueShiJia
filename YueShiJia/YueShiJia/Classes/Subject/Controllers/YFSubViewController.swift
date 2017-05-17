//
//  YFSubViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

private let videoCell = "YFVideoCell"
private let listCell = "YFListCell"
private let mapCell = "YFMapCell"
private let knowledgeCell = "YFKnowledgeCell"
private let humanismCell = "YFHumanismCell"
private let activeCell = "YFActiveCell"

class YFSubViewController: UIViewController {

    //MARK: 定义属性
    
    var special_type: String?
    
    var items = [YFSubjectItem]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kWidth, height: kHeight - kNavigationHeight - kSubjectHeaderHeight - kToolBarHeight))
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        tableView.register(UINib.init(nibName: videoCell, bundle: nil), forCellReuseIdentifier: videoCell)
        tableView.register(UINib.init(nibName: listCell, bundle: nil), forCellReuseIdentifier: listCell)
        tableView.register(UINib.init(nibName: mapCell, bundle: nil), forCellReuseIdentifier: mapCell)
        tableView.register(UINib.init(nibName: knowledgeCell, bundle: nil), forCellReuseIdentifier: knowledgeCell)
        tableView.register(UINib.init(nibName: humanismCell, bundle: nil), forCellReuseIdentifier: humanismCell)
        tableView.register(UINib.init(nibName: activeCell, bundle: nil), forCellReuseIdentifier: activeCell)
        return tableView
    }()
    
    
    //MARK: 生命周期函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

//MARK: 网络加载
extension YFSubViewController {
    fileprivate func loadData() {
        YFHttpRequest.shareInstance.loadSubjectData(special_type!) { [weak self] (items) in
            self?.items = items
            self?.tableView.reloadData()
        }
    }
}

//MARK: 设置UI
extension YFSubViewController {
    fileprivate func setUI() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

//MARK: 方法
extension YFSubViewController {
    
}

//MARK: UITableView代理方法
extension YFSubViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch special_type! {
        case "1":
            let cell = tableView.dequeueReusableCell(withIdentifier: videoCell, for: indexPath) as! YFVideoCell
//            cell.homeItem = items[indexPath.row]
            return cell
        case "2":
            let cell = tableView.dequeueReusableCell(withIdentifier: listCell, for: indexPath) as! YFListCell
            cell.item = items[indexPath.row]
            return cell
        case "3":
            let cell = tableView.dequeueReusableCell(withIdentifier: knowledgeCell, for: indexPath) as! YFKnowledgeCell
//            cell.item = items[indexPath.row]
            return cell
        case "4":
            let cell = tableView.dequeueReusableCell(withIdentifier: humanismCell, for: indexPath) as! YFHumanismCell
            //            cell.homeItem = items[indexPath.row]
            return cell
        case "5":
            let cell = tableView.dequeueReusableCell(withIdentifier: mapCell, for: indexPath) as! YFMapCell
            cell.item = items[indexPath.row]
            return cell
        case "6":
            let cell = tableView.dequeueReusableCell(withIdentifier: activeCell, for: indexPath) as! YFActiveCell
            //            cell.item = items[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }

}

