//
//  CheckHomeFeedCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func checkFeedCell(collectionView: UICollectionView, by indexPath: IndexPath)-> UICollectionViewCell {
        
        var cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.actionId.stringValue, indexPath: indexPath)
        switch indexPath.item {
        case 0: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.actionId.stringValue, indexPath: indexPath)
        case 1: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.adventureId.stringValue, indexPath: indexPath)
        case 2: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.animationId.stringValue, indexPath: indexPath)
        case 3: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.comedyId.stringValue, indexPath: indexPath)
        case 4: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.crimeId.stringValue, indexPath: indexPath)
        case 5: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.documentaryId.stringValue, indexPath: indexPath)
        case 6: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.dramaId.stringValue, indexPath: indexPath)
        case 7: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.familyId.stringValue, indexPath: indexPath)
        case 8: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.fantasyId.stringValue, indexPath: indexPath)
        case 9: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.historyId.stringValue, indexPath: indexPath)
        case 10: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.horrorId.stringValue, indexPath: indexPath)
        case 11: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.musicId.stringValue, indexPath: indexPath)
        case 12: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.mysteryId.stringValue, indexPath: indexPath)
        case 13: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.romanceId.stringValue, indexPath: indexPath)
        case 14: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.scienceFictionId.stringValue, indexPath: indexPath)
        case 15: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.tvMovieId.stringValue, indexPath: indexPath)
        case 16: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.thrillerId.stringValue, indexPath: indexPath)
        case 17: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.warId.stringValue, indexPath: indexPath)
        default: cell = showCell(collectionView: collectionView, reuseIdentifier: ReuseIdentifier.westernId.stringValue, indexPath: indexPath)
        }
        
        return cell
    }
    
    func showCell(collectionView: UICollectionView, reuseIdentifier: String, indexPath: IndexPath)-> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BaseFeedCell else { return UICollectionViewCell() }
        cell.homeViewController = self
        return cell
    }
}
