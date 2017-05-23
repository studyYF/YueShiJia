//
//  YFChannerCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/23.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFChannerCell: UITableViewCell {

    //MARK: 属性
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var saleImgv: UIImageView!
    @IBOutlet weak var goodsNameLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    var channer: Channer? {
        didSet {
            if let channer = channer {
                goodsNameLabel.text = channer.goods_name
                titleLabel.text = channer.title
                saleLabel.text = "￥\(channer.zhekou!)"
                priceLabel.text = channer.goods_price
                saleImgv.kf.setImage(with: URL(string: channer.goods_img!))
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        selectionStyle = .none
    }

    
}
