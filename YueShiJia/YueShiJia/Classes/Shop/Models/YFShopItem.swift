//
//  YFShopItem.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/22.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFShopItem: NSObject {

    var is_display: String?

    var special_start_time: String?

    var special_id: String?

    var special_image2: String?

    var special_background_color: String?

    var special_image_large: String?

    var special_article_ids: String?

    var special_image_all: String?

    var special_title: String?

    var special_margin_top: String?

    var special_stitle: String?

    var english_title: String?

    var special_modify_time: String?

    var special_content: String?

    var special_background: String?

    var special_repeat: String?

    var special_type: String?

    var special_image: String?

    var special_publish_id: String?

    var special_state: String?

    var special_end_time: String?
    
    init(dict: [String : Any]) {
        
        is_display = dict["is_display"] as? String
        
        special_start_time = dict["special_start_time"] as? String
        
        special_id = dict["special_id"] as? String
        
        special_image2 = dict["special_image2"] as? String
        
        special_background_color = dict["special_background_color"] as? String
        
        special_image_large = dict["special_image_large"] as? String
        
        special_article_ids = dict["special_article_ids"] as? String
        
        special_image_all = dict["special_image_all"] as? String
        
        special_title = dict["special_title"] as? String
        
        special_margin_top = dict["special_margin_top"] as? String
        
        special_stitle = dict["special_stitle"] as? String
        
        english_title = dict["english_title"] as? String
        
        special_modify_time = dict["special_modify_time"] as? String
        
        special_content = dict["special_content"] as? String
        
        special_background = dict["special_background"] as? String
        
        special_repeat = dict["special_repeat"] as? String
        
        special_type = dict["special_type"] as? String
        
        special_image = dict["special_image"] as? String
        
        special_publish_id = dict["special_publish_id"] as? String
        
        special_state = dict["special_state"] as? String
        
        special_end_time = dict["special_end_time"] as? String
    }
}

class ClassifyItem: NSObject {
    
    var is_display: String?

    var tag_type: String?

    var tag_order: String?

    var tag_name: String?

    var tag_img: String?

    var tag_id: String?
    
    init(dict: [String : Any]) {
        super.init()
        is_display = dict["is_display"] as? String
        tag_type = dict["tag_type"] as? String
        tag_order = dict["tag_order"] as? String
        tag_name = dict["tag_name"] as? String
        tag_img = dict["tag_img"] as? String
        tag_id = dict["tag_id"] as? String
    }
}

class Channer: NSObject {
    
    var goods_img: String?

    var goods_price: String?

    var title: String?

    var goods_name: String?

    var zhekou: String?
    
    init(dict: [String: Any]) {
        super.init()
        goods_img = dict["goods_img"] as? String
        goods_price = dict["goods_price"] as? String
        title = dict["title"] as? String
        goods_name = dict["goods_name"] as? String
        zhekou = dict["zhekou"] as? String
    }
}
