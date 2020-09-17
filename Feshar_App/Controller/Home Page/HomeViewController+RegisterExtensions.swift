//
//  HomeRegisterCollectionViews.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    enum ReuseIdentifier: String {
        
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
        collectionView.register(ActionFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.actionId.stringValue)
        collectionView.register(AdventureFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.adventureId.stringValue)
        collectionView.register(AnimationFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.animationId.stringValue)
        collectionView.register(ComedyFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.comedyId.stringValue)
        collectionView.register(CrimeFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.crimeId.stringValue)
        collectionView.register(DocumentaryFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.documentaryId.stringValue)
        collectionView.register(DramaFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.dramaId.stringValue)
        collectionView.register(FamilyFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.familyId.stringValue)
        collectionView.register(FantasyFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.fantasyId.stringValue)
        collectionView.register(HistoryFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.historyId.stringValue)
        collectionView.register(HorrorFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.horrorId.stringValue)
        collectionView.register(MusicFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.musicId.stringValue)
        collectionView.register(MysteryFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.mysteryId.stringValue)
        collectionView.register(RomanceFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.romanceId.stringValue)
        collectionView.register(ScienceFictionFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.scienceFictionId.stringValue)
        collectionView.register(TvMovieFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.tvMovieId.stringValue)
        collectionView.register(ThrillerFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.thrillerId.stringValue)
        collectionView.register(WarFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.warId.stringValue)
        collectionView.register(WesternFeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier.westernId.stringValue)
    }
}
