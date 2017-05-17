//
//  YFMonoTitleView.swift
//  SingleSugar
//
//  Created by YangFan on 2017/4/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

private let kTitleCount: CGFloat = 6

class YFSubjectHeaderView: UIView {
    
    //MARK: 定义属性
    
    //协议属性
    var delegate: YFSubjectHeaderViewDelegate?
    
    ///title数组
    fileprivate var titleItems: [String]
    
    //上次选中按钮
    fileprivate var lastSelectedButton: UIButton?
    
    //下划线View
    fileprivate var lineView: UIView = UIView()
    
    init(frame: CGRect, titleItems: [String]) {
        self.titleItems = titleItems
        super.init(frame: frame)
        configButton()
        configLineView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 移动当前选中按钮
    ///
    /// - Parameter index: 下标
    func moveSelectedTitle(_ index: Int) {
        selectedAction(subviews[index] as! UIButton)
    }
}

//MARK: 初始化UI
extension YFSubjectHeaderView {
    //初始化按钮
    func configButton() {
        //1.算出每个按钮宽度
        //2.初始化按钮
        //3.设置按钮属性
        let buttonW = kWidth / kTitleCount
        var i = 0
        for title in titleItems {
            let button = UIButton(type: .custom)
            button.setTitle(title, for: .normal)
            button.frame = CGRect(x: buttonW * CGFloat(i), y: 0, width: buttonW, height: yfHeight)
            button.tag = 300 + i
            button.setTitleColor(UIColor(red:0.66, green:0.66, blue:0.66, alpha:1.00), for: .normal)
            button.setTitleColor(kColor, for: .selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(YFSubjectHeaderView.selectedAction(_:)), for: .touchUpInside)
            addSubview(button)
            i += 1
        }
        
        
        //添加分割线
        let sepeaterView = UIView(frame: CGRect(x: 0, y: yfHeight - 0.5, width: yfWidth, height: 0.5))
        sepeaterView.backgroundColor = kLightColor
        addSubview(sepeaterView)

        
    }
    //初始化下划线
    func configLineView() {
        lineView.frame = CGRect(x: 0, y: yfHeight - 0.5, width: 0, height: 0.5)
        lineView.backgroundColor = kColor
        addSubview(lineView)
        let button = subviews[0] as! UIButton
        button.isSelected = true
        lastSelectedButton = button
        button.titleLabel?.sizeToFit()
        lineView.frame.size.width = (button.titleLabel?.yfWidth)! + 30
        lineView.center.x = button.yfCenterX
    }
}

//MARK: 方法
extension YFSubjectHeaderView {
    @objc fileprivate func selectedAction(_ button: UIButton) {
        lastSelectedButton?.isSelected = false
        button.isSelected = !button.isSelected
        lastSelectedButton = button
        UIView.animate(withDuration: 0.3) {
            self.lineView.frame.size.width = (button.titleLabel?.yfWidth)! + 30
            self.lineView.center.x = button.yfCenterX
        }
        //回调给控制器
        delegate?.selectedTitle(button.tag - 300)
    }
    
    @objc fileprivate func arrowButtonAction(_ button: UIButton) {
        UIView.animate(withDuration: 0.2) { 
            button.imageView?.transform = (button.imageView?.transform.rotated(by: CGFloat.pi))!
        }
    }
}


//MARK: 选中title的代理
protocol YFSubjectHeaderViewDelegate {
    //选中的index
    func selectedTitle(_ index: Int)
}
