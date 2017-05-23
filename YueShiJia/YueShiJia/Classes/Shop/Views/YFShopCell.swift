//
//  YFShopCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/22.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFShopCell: UITableViewCell {

    //MARK: 属性
    
    @IBOutlet weak var shopImgv: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: YFShopItem? {
        didSet {
            if let item = item {
                shopImgv.kf.setImage(with: URL(string: item.special_image!), placeholder: UIImage(named: "bg_loding_defalut"))
                topicLabel.text = item.english_title
                titleLabel.text = item.special_title
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
}
