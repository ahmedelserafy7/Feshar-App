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
        
        var cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.actionId.stringValue, indexPath: indexPath)
        
        if indexPath.item == 0 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.actionId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 1 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.adventureId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 2 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.animationId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 3 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.comedyId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 4 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.crimeId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 5 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.documentaryId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 6 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.dramaId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 7 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.familyId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 8 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.fantasyId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 9 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.historyId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 10 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.horrorId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 11 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.musicId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 12 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.mysteryId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 13 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.romanceId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 14 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.scienceFictionId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 15 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.tvMovieId.stringValue, indexPath: indexPath)
            
        } else if indexPath.item == 16 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.thrillerId.stringValue, indexPath: indexPath)
            
        }  else if indexPath.item == 17 {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.warId.stringValue, indexPath: indexPath)
            
        } else {
            
            cell = showCell(collectionView: collectionView, reuseIdentifier: ResuseIdentifier.westernId.stringValue, indexPath: indexPath)
        }
        
        return cell
    }
    
    func showCell(collectionView: UICollectionView, reuseIdentifier: String, indexPath: IndexPath)-> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BaseFeedCell else { return UICollectionViewCell() }
        cell.homeViewController = self
        return cell
    }
}
