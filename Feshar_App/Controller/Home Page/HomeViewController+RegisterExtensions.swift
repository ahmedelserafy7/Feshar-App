//
//  HomeRegisterCollectionViews.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    enum ResuseIdentifier: String {
        
        case actionId, adventureId, animationId, comedyId, crimeId, documentaryId, dramaId, familyId, fantasyId, historyId, horrorId, musicId, mysteryId, romanceId, scienceFictionId, tvMovieId, thrillerId, warId, westernId
        
        var stringValue: String {
            switch self {
            case .actionId: return "actionId"
            case .adventureId: return "adventureId"
            case .animationId: return "animationId"
            case .comedyId: return "comedyId"
            case .crimeId: return "crimeId"
            case .documentaryId: return "documentaryId"
            case .dramaId: return "dramaId"
            case .familyId: return "familyId"
            case .fantasyId: return "fantasyId"
            case .historyId: return "historyId"
            case .horrorId: return "horrorId"
            case .musicId: return "musicId"
            case .mysteryId: return "mysteryId"
            case .romanceId: return "romanceId"
            case .scienceFictionId: return "scienceFictionId"
            case .tvMovieId: return "tvMovieId"
            case .thrillerId: return "thrillerId"
            case .warId: return "warId"
            case .westernId: return "westernId"
            }
        }
    }
    
    func registerCollectionView() {
        
        collectionView.register(ActionFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.actionId.stringValue)
        collectionView.register(AdventureFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.adventureId.stringValue)
        collectionView.register(AnimationFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.animationId.stringValue)
        collectionView.register(ComedyFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.comedyId.stringValue)
        collectionView.register(CrimeFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.crimeId.stringValue)
        collectionView.register(DocumentaryFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.documentaryId.stringValue)
        collectionView.register(DramaFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.dramaId.stringValue)
        collectionView.register(FamilyFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.familyId.stringValue)
        collectionView.register(FantasyFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.fantasyId.stringValue)
        collectionView.register(HistoryFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.historyId.stringValue)
        collectionView.register(HorrorFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.horrorId.stringValue)
        collectionView.register(MusicFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.musicId.stringValue)
        collectionView.register(MysteryFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.mysteryId.stringValue)
        collectionView.register(RomanceFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.romanceId.stringValue)
        collectionView.register(ScienceFictionFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.scienceFictionId.stringValue)
        collectionView.register(TvMovieFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.tvMovieId.stringValue)
        collectionView.register(ThrillerFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.thrillerId.stringValue)
        collectionView.register(WarFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.warId.stringValue)
        collectionView.register(WesternFeedCell.self, forCellWithReuseIdentifier: ResuseIdentifier.westernId.stringValue)
    }
}
