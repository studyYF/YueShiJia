//
//  UIButtonExtension.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/16.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(imageName: String) {
       self.init(type: .custom)
        setImage(UIImage(named: imageName), for: .normal)
        frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    }
}
