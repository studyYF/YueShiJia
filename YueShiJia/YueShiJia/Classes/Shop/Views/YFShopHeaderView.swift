//
//  YFShopHeaderView.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/22.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import SDCycleScrollView

private let tagCell = "YFShopClassifyCell"

class YFShopHeaderView: UITableViewHeaderFooterView {

    //MARK: 属性
    @IBOutlet weak var bannerView: SDCycleScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var bannerItems: [Banner]? {
        didSet {
            if let bannerItems = bannerItems {
                var urlItems = [String]()
                for item in bannerItems {
                    urlItems.append(item.advertImg!)
                }
                bannerView.imageURLStringsGroup = urlItems
            }
        }
    }
    
    var classifyItem: [ClassifyItem]? {
        didSet {
            if let _ = classifyItem {
                collectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerView.delegate = self
        bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: tagCell, bundle: nil), forCellWithReuseIdentifier: tagCell)
    }
}

extension YFShopHeaderView: SDCycleScrollViewDelegate {
    
}

extension YFShopHeaderView: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classifyItem?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCell, for: indexPath) as! YFShopClassifyCell
        cell.item = classifyItem?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88 * kRate, height: 88 * kRate)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * kRate
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0 * kRate, 1.5 * kRate, 0 * kRate, 1.5 * kRate)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
