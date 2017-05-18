//
//  YFActiveItem.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/18.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFActiveItem: NSObject {

    var virtual_indate: String?

    var goods_image: String?

    var type_virtual: Int = 0

    var hint_virtual: String?

    var end_virtual: String?

    var goods_name: String?

    var store_id: String?

    var goods_id: String?
    
    init(dict: [String: Any]) {
        super.init()
        goods_image = dict["goods_image"] as? String
        end_virtual = dict["end_virtual"] as? String
        goods_name = dict["goods_name"] as? String
        goods_id = dict["goods_id"] as? String
        hint_virtual = dict["hint_virtual"] as? String
    }
}
