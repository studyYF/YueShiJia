//
//  YFSpecialGoodsHeaderView.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/16.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFSpecialGoodsHeaderView: UITableViewHeaderFooterView {

    //MARK: 属性
    
    @IBOutlet weak var imgvHeightConstraints: NSLayoutConstraint!
    var imgvUrl: String? {
        didSet {
            imgv.kf.setImage(with: URL(string: imgvUrl!))
        }
    }
    
    var text: String? {
        didSet {
            label.text = text!
        }
    }
    
    @IBOutlet weak var imgv: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgvHeightConstraints.constant = 280 * kRate
    }
    
}
