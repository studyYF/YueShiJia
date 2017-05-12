//
//  YFHomeTypeTwoCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFHomeTypeTwoCell: UITableViewCell {

    
    //MARK: 属性
    
    @IBOutlet weak var goodsImageView: UIImageView!
    
    @IBOutlet weak var imgeViewHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var item: YFHomeItem? {
        didSet {
            goodsImageView.kf.setImage(with: URL(string: (item?.relation_object_image)!))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
         selectionStyle = .none
        imgeViewHeightConstraints.constant = 80 * kRate
        bottomConstraint.constant = 25 * kRate
    }

    
    
}
