//
//  YFRefreshHeader.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import MJRefresh

class YFRefreshHeader: MJRefreshHeader {

    var imgv: UIImageView?
    
    var label: UILabel?
    
    
    /// 初始化控件
    override func prepare() {
        super.prepare()
        imgv = UIImageView()
        imgv?.image = UIImage(named: "MJRefreshSmallGifHeader1")
        addSubview(imgv!)
        
        label = UILabel()
        label?.text = "下拉可以刷新"
        label?.textColor = UIColor.lightGray
        label?.font = UIFont.systemFont(ofSize: 12)
        addSubview(label!)
    }
    

    /// 设置控件的位置和尺寸
    override func placeSubviews() {
        super.placeSubviews()
        imgv?.frame = CGRect(x: kWidth * 0.5 - 60, y: yfHeight * 0.5 - 5, width: 10, height: 10)
        label?.frame = CGRect(x: kWidth * 0.5 - 40, y: 0, width: 80, height: yfHeight)
    }
    
    func imgvStartAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = CGFloat.pi * 2
        animation.fromValue = 0
        animation.duration = 0.5
        animation.repeatCount = MAXFLOAT
        imgv?.layer.add(animation, forKey: "transform.rotation")
    }
    
    func imgvStopAnimation() {
        imgv?.layer.removeAllAnimations()
    }
   
    
    /// 监听状态
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                imgvStopAnimation()
                label?.text = "下拉可以刷新"
                break
            case .pulling:
                label?.text = "松开立即刷新"
                break
            case .refreshing:
                imgvStartAnimation()
                label?.text = "加载中......"
                break
            default:
                break
            }
        }
    }

}
