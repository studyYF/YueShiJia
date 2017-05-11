//
//  YFHttpRequest.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/9.
//  Copyright © 2017年 YangFan. All rights reserved.
//网络请求工具

/**
 首页
 https://interface.yueshichina.com/?act=app&op=index1&app_id=1002&channel=APPSTORE&client=ios&curpage=1&imei=B2624433-81D9-4205-AF20-892FDBB80EE8&net_type=WIFI&page=10&push_id=4627676201928478325&req_time=1494315520869&token=&v=2.1.3&version=10.3.1
 */




import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON


class YFHttpRequest {
    /// 单例
    static let  shareInstance = YFHttpRequest()
    
    /// 定义首页数据请求返回的类型
    typealias homeData = ([YFHomeItem],[Banner],[YFHomeHeaderItem])
    
    /// 网络请求基本方法
    ///
    /// - Parameters:
    ///   - method: 请求方式
    ///   - url: 地址
    ///   - param: 参数
    ///   - completion: 完成后回调
    private func baseRequest(_ method: HTTPMethod = .get, url: String, param: [String: Any]? = nil, completion: @escaping(Any) -> ()) {
        Alamofire.request(url, method: method, parameters: param).responseJSON { (response) in
            //如果请求失败，则直接返回，并提示加载失败
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败！")
                return
            }
            //如果有返回值，则回调
            if let value = response.result.value {
                completion(value)
            }
        }
    }
    
    
    public func loadHomeData(_ page: Int, completion: @escaping (homeData) -> ()) {
        let url = "https://interface.yueshichina.com/?act=app&op=index1&app_id=1002&channel=APPSTORE&client=ios&curpage=\(page)&imei=B2624433-81D9-4205-AF20-892FDBB80EE8&net_type=WIFI&page=10&push_id=4627676201928478325&req_time=1494315520869&token=&v=2.1.3&version=10.3.1"
        baseRequest(url: url) { (response) in
            let dict = JSON(response)
            let code = dict["code"].intValue
            guard code == kSuccessCode else {
                SVProgressHUD.showError(withStatus: "请求失败")
                return
            }
            if let dict = dict["datas"].dictionary {
                //商品数组
                var homeItems = [YFHomeItem]()
                //广告
                var banners = [Banner]()
                //四个分类
                var headItems = [YFHomeHeaderItem]()
                if let home = dict["data_type"]?.arrayObject {
                    for item in home {
                        homeItems.append(YFHomeItem(dict: item as! [String : Any]))
                    }
                }
                if let banner = dict["banner"]?.arrayObject {
                    for item in banner {
                        banners.append(Banner(dict: item as! [String : Any]))
                    }
                }
                
                if let four = dict["relation_good_four"]?.arrayObject {
                    for item in four {
                        headItems.append(YFHomeHeaderItem(dict: item as! [String : Any]))
                    }
                }
                completion((homeItems, banners, headItems))
            }
        }
    }
}