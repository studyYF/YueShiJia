//
//  YFSpecailGoodsCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/15.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFSpecailGoodsCell: UITableViewCell {

    //MARK: 属性
    var item: Goods_List? {
        didSet{
            iconImgv.kf.setImage(with: URL(string: (item?.goods_image_url)!),placeholder: UIImage(named: "bg_loding_defalut"))
            titleLabel.text = item?.goods_name
            descLabel.text = item?.goods_jingle
            originPriceLabel.text = "原价:￥\((item?.goods_marketprice)!)"
            salesLabel.text = "销量:\((item?.goods_salenum)!)件"
            buyButton.setTitle("￥\((item?.goods_price)!) 购买", for: .normal)
        }
    }
    
    @IBOutlet weak var iconImgv: UIImageView!
    
    @IBOutlet weak var salesLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        buyButton.layer.borderColor = kColor.cgColor
        buyButton.layer.borderWidth = 0.5
    }

    @IBAction func buyAction(_ sender: Any) {
    }
    
    
}
