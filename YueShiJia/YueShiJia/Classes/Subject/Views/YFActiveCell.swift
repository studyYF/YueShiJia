//
//  YFActiveCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFActiveCell: UITableViewCell {

    //MARK: 属性
    @IBOutlet weak var activeImgv: UIImageView!
    @IBOutlet weak var goodsNameLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var activeEndLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgvConstraint: NSLayoutConstraint!
    
    var item: YFActiveItem? {
        didSet {
            activeImgv.kf.setImage(with: URL(string: (item?.goods_image)!))
            hintLabel.text = item?.hint_virtual
            goodsNameLabel.text = item?.goods_name
            activeEndLabel.text = item?.end_virtual
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imgvConstraint.constant = 170 * kRate
        backView.backgroundColor = UIColor(white: 1, alpha: 0.8)
    }

    
    
}
