//
//  YFCountCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/24.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFCountCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
