//
//  YFHomeHeaderView.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import SDCycleScrollView
import Kingfisher
import SDWebImage


protocol YFHomeHeaderViewDelegate {
    func advertiseSelected(_ index: Int)
}

class YFHomeHeaderView: UITableViewHeaderFooterView {
    //MARK: 属性
    
    var delegate: YFHomeHeaderViewDelegate?
    
    /// 轮播图
    @IBOutlet weak var imageScrollView: SDCycleScrollView!
    
    @IBOutlet weak var categoryOneButton: YFHomeButton!
    
    @IBOutlet weak var categoryTwoButton: YFHomeButton!
    
    @IBOutlet weak var categoryThreeButton: YFHomeButton!
    
    @IBOutlet weak var categoryFourButton: YFHomeButton!
    
    
    /// 轮播数组
    public var imageItems: [Banner]? {
        didSet {
            var urlItems = [String]()
            for item in imageItems! {
                urlItems.append(item.advertImg!)
            }
            imageScrollView.imageURLStringsGroup = urlItems
        }
    }
    
    /// 分类数组
    public var fourItems: [YFHomeHeaderItem]? {
        didSet {
            let buttonArray = [categoryOneButton, categoryTwoButton, categoryThreeButton, categoryFourButton]
            var i = 0
            for item in fourItems! {
                buttonArray[i]?.sd_setImage(with: URL(string: item.relation_index_img!), for: .normal)
                buttonArray[i]?.setTitle(item.relation_object_title, for: .normal)
                i += 1
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.white
        imageScrollView.delegate = self
        imageScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
    }

    @IBAction func selectedCategory(_ sender: YFHomeButton) {
        print("选择分类")
    }
    

}

extension YFHomeHeaderView {
    
}

// MARK: - SDCycleScrollViewDelegate
extension YFHomeHeaderView: SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        if let delegate = delegate {
            delegate.advertiseSelected(index)
        }
    }
}
