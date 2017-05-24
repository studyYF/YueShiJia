//
//  YFHomeButton.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFHomeButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: yfWidth * 0.5 - 15 * kRate, y: yfHeight * 0.5 - 35 * kRate, width: 30 * kRate, height: 30 * kRate)
        titleLabel?.frame = CGRect(x: 0, y: yfHeight * 0.5 + 5 * kRate, width: yfWidth, height: (titleLabel?.yfHeight)!)
        titleLabel?.textAlignment = .center
    }
}

class YFProfileButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: yfWidth * 0.5 - 10 * kRate, y: yfHeight * 0.5 - 30 * kRate, width: 20 * kRate, height: 20 * kRate)
        titleLabel?.frame = CGRect(x: 0, y: yfHeight * 0.5 + 5 * kRate, width: yfWidth, height: (titleLabel?.yfHeight)!)
        titleLabel?.textAlignment = .center
    }
}
