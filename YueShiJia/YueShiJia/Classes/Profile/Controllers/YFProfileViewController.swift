//
//  YFProfileViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/23.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit


class YFProfileViewController: UITableViewController {

    //MARK: 属性
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: kWidth * 0.5 - 100, y: 0, width: 200, height: 40))
        label.text = "phone_13818556154"
        label.textAlignment = .center
        label.textColor = kColor
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.lt_reset()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
        scrollViewDidScroll(tableView)
    }
}

extension YFProfileViewController {
    fileprivate func setUI() {
        //1.设置tableView头视图
        //设置tableView头部缩放图片 *一行代码就集成了*
        tableView.yz_headerScaleImage = UIImage(named: "mine_backgroundImg")
        tableView.yz_headerScaleImageHeight = 180 * kRate
        // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 180 * kRate))
        // 清空头部视图背景颜色
        headerView.backgroundColor = UIColor.clear
        //添加头像
        let iconImgv = UIImageView(frame: CGRect(x: kWidth * 0.5 - 45 * kRate, y: 20 * kRate, width: 90 * kRate, height: 90 * kRate))
        iconImgv.layer.cornerRadius = 45 * kRate
        iconImgv.clipsToBounds = true
        iconImgv.image = UIImage(named: "bg_loding_defalut")
        headerView.addSubview(iconImgv)
        //添加用户名
        let usernameLabel = UILabel(frame: CGRect(x: 50, y: 115 * kRate, width: kWidth - 100, height: 50))
        usernameLabel.textAlignment = .center
        usernameLabel.text = "phone_13818556154"
        usernameLabel.textColor = UIColor.white
        headerView.addSubview(usernameLabel)
        tableView.tableHeaderView = headerView;
        
        //2.设置导航栏标题
        let settingButton = UIButton(imageName: "mine_setting")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: settingButton)
        //3.设置标题
        navigationItem.titleView = label
    }
}

//MARK: 重写tablview代理方法
extension YFProfileViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let color = UIColor.white
        if scrollView.contentOffset.y > 50 {
            let alpha = 1 - (50 + 64 - scrollView.contentOffset.y) / 64
            navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(min(1, alpha)))
            label.alpha = min(1, alpha)
        } else {
            navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(0))
            navigationController?.navigationItem.titleView?.alpha = 0
            label.alpha = 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return Bundle.main.loadNibNamed("YFOrderCell", owner: self, options: nil)?.last as! YFOrderCell
        } else if indexPath.section == 1 {
            return Bundle.main.loadNibNamed("YFCountCell", owner: self, options: nil)?.last as! YFCountCell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 110 * kRate
        } else if indexPath.section == 1 {
            return 90 * kRate
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 44 * kRate
        } else {
            return 0.1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = Bundle.main.loadNibNamed("YFOrderHeaderView", owner: self, options: nil)?.last as!YFOrderHeaderView
            return view
        } else if section == 1 {
            let view = Bundle.main.loadNibNamed("YFCountHeaderView", owner: self, options: nil)?.last as! YFCountHeaderView
            return view
        }
        return UIView()
    }
    
    
}
