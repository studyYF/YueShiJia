//
//  YFAdvetiseItem.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/12.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFSpecialGoodsItem: NSObject {

    var special_sum: Int?

    var special_share_url: String?

    var special_image: String?

    var news_special: [News_Special]?

    var special_tis: String?

    var special_id: String?

    var special_title: String?

    var special_stitle: String?
    
    init(dict: [String: Any]) {
        special_sum = dict["special_sum"] as? Int
        special_share_url = dict["special_share_url"] as? String
        special_image = dict["special_image"] as? String
        special_id = dict["special_id"] as? String
        special_title = dict["special_title"] as? String
        special_stitle = dict["special_stitle"] as? String
        if let array = dict["news_special"] as? NSArray {
            news_special = [News_Special]()
            for good in array {
                news_special?.append(News_Special(dict: good as! [String : Any]))
            }
        }

    }
    
}
class News_Special: NSObject {

    var object_font: String?

    var special_type: Int?
    
    var goods_list: [Goods_List]?
    
    init(dict: [String: Any]) {
        object_font = dict["object_font"] as? String
        special_type = dict["special_type"] as? Int
        if let array = dict["goods_list"] as? NSArray {
            goods_list = [Goods_List]()
            for good in array {
                goods_list?.append(Goods_List(dict: good as! [String : Any]))
            }
        }
    }

}

class Goods_List: NSObject {
    
    var is_presell: String?

    var sole_flag: Bool?

    var is_fcode: String?

    var if_favorites: Int?

    var is_own_shop: String?

    var goods_jingle: String?

    var goods_marketprice: String?

    var group_flag: Bool?

    var specif_set: String?

    var goods_image: String?

    var goods_name: String?

    var goods_salenum: String?

    var store_id: String?

    var evaluation_good_star: String?

    var goods_image_long: String?

    var store_name: String?

    var store_logo: String?

    var tag_print: String?

    var evaluation_count: String?

    var goods_custom: String?

    var goods_image_url: String?

    var xianshi_flag: Bool?

    var goods_price: String?

    var goods_id: String?

    var have_gift: String?

    var is_virtual: String?
    
    init(dict: [String: Any]) {
        is_presell = dict[""] as? String
        
        sole_flag = dict["sole_flag"] as? Bool

        is_fcode = dict["is_fcode"] as? String

        if_favorites = dict["if_favorites"] as? Int

        is_own_shop = dict["is_own_shop"] as? String

        goods_jingle = dict["goods_jingle"] as? String

        goods_marketprice = dict["goods_marketprice"] as? String

        group_flag = dict["group_flag"] as? Bool

        specif_set = dict["specif_set"] as? String

        goods_image = dict["goods_image"] as? String

        goods_name = dict["goods_name"] as? String

        goods_salenum = dict["goods_salenum"] as? String

        store_id = dict["store_id"] as? String

        evaluation_good_star = dict["evaluation_good_star"] as? String

        goods_image_long = dict["goods_image_long"] as? String

        store_name = dict["store_name"] as? String

        store_logo = dict["store_logo"] as? String
        
        tag_print = dict["tag_print"] as? String

        evaluation_count = dict["evaluation_count"] as? String

        goods_custom = dict["goods_custom"] as? String

        goods_image_url = dict["goods_image_url"] as? String

        xianshi_flag = dict["xianshi_flag"] as? Bool

        goods_price = dict["goods_price"] as? String

        goods_id = dict["goods_id"] as? String

        have_gift = dict["have_gift"] as? String

        is_virtual = dict["is_virtual"] as? String

    }
    
    
}

