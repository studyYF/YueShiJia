//
//  YFSubjectItem.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/17.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFSubjectItem: NSObject {

    
    var article_abstract: String?

    var article_title: String?

    var article_origin: String?

    var article_video: String?

    var article_publish_time: String?

    var article_id: String?

    var article_image: String?

    var top: String?

    var video_length: String?
    
    init(dict: [String : Any]) {
        super.init()
        article_abstract = dict["article_abstract"] as? String
        article_title = dict["article_title"] as? String
        article_origin = dict["article_origin"] as? String
        article_video = dict["article_video"] as? String
        article_publish_time = dict["article_publish_time"] as? String
        article_id = dict["article_id"] as? String
        article_image = dict["article_image"] as? String
        top = dict["top"] as? String
        video_length = dict["video_length"] as? String
    }
}
