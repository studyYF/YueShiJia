//
//  YFVideoCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFVideoCell: UITableViewCell {

    
    //MARK: 属性
    @IBOutlet weak var knowImgv: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var imgvHeight: NSLayoutConstraint!
    
    var item: YFSubjectItem? {
        didSet {
            knowImgv.kf.setImage(with: URL(string: (item?.article_image)!),placeholder: UIImage(named: "bg_loding_defalut"))
            titleLabel.text = item?.article_title
            desLabel.text = item?.article_abstract
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imgvHeight.constant = 210 * kRate
    }

   
}
