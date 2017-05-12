//
//  YFItemCollectionCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFItemCollectionCell: UICollectionViewCell {

    //MARK: 属性
    
    /// 图片
    @IBOutlet weak var iconImageView: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 价格
    @IBOutlet weak var priceLabel: UILabel!
    
    var item: Goods_Special_List? {
        didSet {
            iconImageView.kf.setImage(with: URL(string: (item?.goods_img!)!))
            titleLabel.text = item?.goods_name
            priceLabel.text = "￥\((item?.goods_price)!)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceLabel.textColor = kColor
        layer.borderWidth = 0.3
        layer.borderColor = kColor.cgColor
    }

}
