//
//  YFHomeTypeThreeCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFHomeTypeThreeCell: UITableViewCell {
    //MARK: 属性
    
    @IBOutlet weak var goodImgv: UIImageView!
    
    /// 商品名称
    @IBOutlet weak var goodsNameLabel: UILabel!
    
    /// 商品描述
    @IBOutlet weak var goodDesLabel: UILabel!
    
    /// 价格，购买按钮
    @IBOutlet weak var priceButton: UIButton!
    
    /// 收藏按钮
    @IBOutlet weak var likeButton: UIButton!
    
    var item: YFHomeItem? {
        didSet {
            goodImgv.kf.setImage(with: URL(string: (item?.relation_object_image)!))
            goodsNameLabel.text = item?.relation_object_title
            goodDesLabel.text = item?.relation_object_jingle
            priceButton.setTitle("￥\((item?.goods_price)!)", for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        priceButton.layer.borderColor = kColor.cgColor
        priceButton.layer.borderWidth = 0.3
        likeButton.layer.borderColor = kColor.cgColor
        likeButton.layer.borderWidth = 0.3
        likeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
    }

    
    
}
