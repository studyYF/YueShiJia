//
//  YFHomeTypeOneCell.swift
//  YueShiJia
//
//  Created by YangFan on 2017/5/11.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit
import Kingfisher

private let collectionCell = "YFItemCollectionCell"

protocol YFHomeTypeOneCellDelegate {
    func seletcedSpecialGood(_ Index: Int)
}

class YFHomeTypeOneCell: UITableViewCell {

    
    //MARK: 定义属性
    
    var delegate: YFHomeTypeOneCellDelegate?
    
    @IBOutlet weak var categoryImageView: UIImageView!
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var imgvHeightConstraint: NSLayoutConstraint!
    
    var homeItem: YFHomeItem? {
        didSet {
            categoryImageView.kf.setImage(with: URL(string: (homeItem?.relation_object_image)!))
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        collectionView.register(UINib.init(nibName: collectionCell, bundle: nil), forCellWithReuseIdentifier: collectionCell)
        collectionHeightConstraints.constant = 250.5 * kRate
        imgvHeightConstraint.constant = 180 * kRate
    }
}

extension YFHomeTypeOneCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (homeItem?.goods_special_list?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as! YFItemCollectionCell
        cell.item = homeItem?.goods_special_list?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.seletcedSpecialGood(indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 112 * kRate, height: 185 * kRate)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8 * kRate
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(15 * kRate, 10 * kRate, 50.5 * kRate, 10 * kRate)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5 * kRate
    }
}

