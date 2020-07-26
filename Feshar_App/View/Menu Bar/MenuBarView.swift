//
//  MenuBar.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let menuCellId = "menuCellId"
    var genres = [Genre]()
    var homeController: HomeViewController?
    func showCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getGenres()
    }
    
    func getGenres() {
        Genres.shared.fetchGenres { [unowned self] genres in
            self.genres = genres
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as! MenuBarViewCell
        cell.menuBarLabel.text = genres[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3 - 28, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        selectDefaultItem()
    }
    
    func selectDefaultItem() {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition())
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.scroll(to: indexPath.item)
    }
}
