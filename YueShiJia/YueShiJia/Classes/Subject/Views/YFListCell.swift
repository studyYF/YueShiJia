//
//  YFListCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFListCell: UITableViewCell {

    
    //MARK: 属性
    @IBOutlet weak var listImgv: UIImageView!
    @IBOutlet weak var postBackView: UIView!
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var listRangeLabel: UILabel!
    @IBOutlet weak var listNameLabel: UILabel!
    
    var item: YFSubjectItem? {
        didSet {
            listImgv.kf.setImage(with: URL(string: (item?.article_image)!),placeholder: UIImage(named: "bg_loding_defalut"))
            listNameLabel.text = item?.article_abstract
            listRangeLabel.text = "TOP \((item?.top)!)"
            desLabel.text = item?.article_title
            fromLabel.text = "From \((item?.article_origin)!)"
        }
    }
    @IBOutlet weak var imgvHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imgvHeightConstraint.constant = 233.5 * kRate
        postBackView.layer.borderColor = kColor.cgColor
        postBackView.layer.borderWidth = 0.3
    }

    
    
}
