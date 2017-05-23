//
//  YFShopClassifyCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/22.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFShopClassifyCell: UICollectionViewCell {

    @IBOutlet weak var iconimgv: UIImageView!
    @IBOutlet weak var classifyLabel: UILabel!
    
    var item: ClassifyItem? {
        didSet {
            if let item = item {
                iconimgv.kf.setImage(with: URL(string: (item.tag_img)!))
                classifyLabel.text = item.tag_name
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
