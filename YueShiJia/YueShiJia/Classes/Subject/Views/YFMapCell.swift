//
//  YFMapCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFMapCell: UITableViewCell {

    @IBOutlet weak var imgvConstraint: NSLayoutConstraint!
    
    //MARK: 属性
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var foodImgv: UIImageView!
    
    var item: YFSubjectItem? {
        didSet {
            foodImgv.kf.setImage(with: URL(string: (item?.article_image)!),placeholder: UIImage(named: "bg_loding_defalut"))
            cityLabel.text = item?.article_title
            shopNameLabel.text = item?.article_abstract
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imgvConstraint.constant = 280 * kRate
    }

    
    
}
