//
//  YFHomeItem.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/9.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import SwiftyJSON


/// 产品
class YFHomeItem: NSObject {

    
    var relation_id: String?

    var relation_object_image: String?

    var relation_type: String?

    var relation_channel_id: String?

    var relation_object_title: String?

    var relation_start_time: String?

    var relation_index_font: String?

    var no_market: Int?
    
    var goods_special_list: [Goods_Special_List]?

    var if_favorites: Int?

    var relation_sort: String?

    var goods_storage: String?

    /// 根据类型判断是哪一种cell
    var relation_object_type: String?

    var relation_state: String?

    var relation_index_img: String?

    var goods_price: String?

    var relation_object_jingle: String?

    var relation_end_time: String?

    var relation_object_id: String?
    
    init(dict: [String: Any]) {
        super.init()
        relation_id = dict["relation_id"] as? String
        relation_object_image = dict["relation_object_image"] as? String
        relation_type = dict["relation_type"] as? String
        relation_channel_id = dict["relation_channel_id"] as? String
        relation_object_title = dict["relation_object_title"] as? String
        relation_start_time = dict["relation_start_time"] as? String
        relation_index_img = dict["relation_index_img"] as? String
        relation_index_font = dict["relation_index_font"] as? String
        relation_sort = dict["relation_sort"] as? String
        relation_object_type = dict["relation_object_type"] as? String
        relation_state = dict["relation_state"] as? String
        relation_object_jingle = dict["relation_object_jingle"] as? String
        relation_end_time = dict["relation_end_time"] as? String
        relation_object_id = dict["relation_object_id"] as? String
        goods_price = dict["goods_price"] as? String
        goods_storage = dict["goods_storage"] as? String
        if_favorites = dict["if_favorites"] as? Int
        no_market = dict["no_market"] as? Int
        if let array = dict["goods_special_list"] as? NSArray {
            goods_special_list = [Goods_Special_List]()
            for good in array {
                goods_special_list?.append(Goods_Special_List(dict: good as! [String : Any]))
            }
        }
    }
}



/// 广告
class Banner: NSObject {

    var advertTitle: String?

    var isMark: Int = 0

    var advertImg: String?

    var advertText: String?

    var advertId: String?

    var advertUrl: String?

    var videoShareUrl: String?

    var advertVideoUrl: String?
    
    init(dict: [String : Any]) {
        super.init()
        advertTitle = dict["advertTitle"] as? String
        isMark = dict["isMark"] as! Int
        advertImg = dict["advertImg"] as? String
        advertText = dict["advertText"] as? String
        advertId = dict["advertId"] as? String
        advertUrl = dict["advertUrl"] as? String
        videoShareUrl = dict["videoShareUrl"] as? String
        advertVideoUrl = dict["advertVideoUrl"] as? String
    }

}




/// 产品集里的产品
class Goods_Special_List: NSObject {

    var goods_id: String?

    var goods_price: String?

    var goods_name: String?

    var goods_img: String?
    
    init(dict: [String: Any]) {
        super.init()
        goods_id = dict["goods_id"] as? String
        goods_price = dict["goods_price"] as? String
        goods_name = dict["goods_name"] as? String
        goods_img = dict["goods_img"] as? String
    }

}


/// 四个分类
class YFHomeHeaderItem: NSObject {

    var relation_id: String?

    var relation_object_image: String?

    var relation_type: String?

    var relation_channel_id: String?

    var relation_object_title: String?

    var relation_start_time: String?

    var relation_index_font: String?

    var relation_sort: String?

    var relation_object_type: String?

    var relation_state: String?

    var relation_index_img: String?

    var relation_object_jingle: String?

    var relation_end_time: String?

    var relation_object_id: String?
    
    init(dict: [String : Any]) {
        relation_id = dict["relation_id"] as? String
        relation_object_image = dict["relation_object_image"] as? String
        relation_type = dict["relation_type"] as? String
        relation_channel_id = dict["relation_channel_id"] as? String
        relation_object_title = dict["relation_object_title"] as? String
        relation_start_time = dict["relation_start_time"] as? String
        relation_index_img = dict["relation_index_img"] as? String
        relation_index_font = dict["relation_index_font"] as? String
        relation_sort = dict["relation_sort"] as? String
        relation_object_type = dict["relation_object_type"] as? String
        relation_state = dict["relation_state"] as? String
        relation_object_jingle = dict["relation_object_jingle"] as? String
        relation_end_time = dict["relation_end_time"] as? String
        relation_object_id = dict["relation_object_id"] as? String
    }

}

