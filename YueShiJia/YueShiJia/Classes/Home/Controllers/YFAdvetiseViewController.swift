//
//  YFAdvetiseViewController.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/12.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

class YFAdvetiseViewController: UIViewController {

    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    fileprivate func setUI() {
        let webView = UIWebView(frame: view.bounds)
        webView.loadRequest(URLRequest(url: URL(string: url!)!))
        webView.sizeToFit()
        view.addSubview(webView)
    }


}

