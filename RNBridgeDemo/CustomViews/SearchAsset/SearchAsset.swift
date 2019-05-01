//
//  SearchAsset.swift
//  RNBridgeDemo
//
//  Created by admin on 2018/10/26.
//  Copyright © 2018年 paradise. All rights reserved.
//

import UIKit

@objc(SearchAsset) class SearchAsset: UIView, CollectionViewSpac {
    
    private var cv: UICollectionView?
    
    @objc var dataSource: [[Any]]! {
        didSet { dataSourceDidChanged(with: dataSource) }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func setup(with rect: CGRect) {
        let collectionView = UICollectionView(frame: rect)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: SearchAssestCell.self)
    }
    
    private func dataSourceDidChanged(with datas: [[Any]]?) {
        guard datas != nil else { return }
        guard let cv = self.cv else { return }
        cv.reloadData()
    }
    
    //MARK: - CV DataSource func.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getCell(with: SearchAssestCell.self, for: indexPath)
        return cell
//        guard let data = dataSource?[safe: indexPath] else { return cell }
    }
}
