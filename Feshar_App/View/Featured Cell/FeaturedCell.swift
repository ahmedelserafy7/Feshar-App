//
//  FeaturedCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/4/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class FeaturedViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tvCollectionView: UICollectionView!
}

extension FeaturedViewCell {
    
    func set<T: UICollectionViewDelegate & UICollectionViewDataSource>(_ collectionView: UICollectionView, by delegateAndDataSource: T) {
        collectionView.delegate = delegateAndDataSource
        collectionView.dataSource = delegateAndDataSource
        collectionView.reloadData()
    }
}
