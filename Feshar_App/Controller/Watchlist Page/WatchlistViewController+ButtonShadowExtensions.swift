//
//  DetailsShadowButtonViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func addedMovieToWatchlist() {
        addToWatchlistButton.setTitle("Added to your Watchlist", for: .normal)
        addToWatchlistButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        addToWatchlistButton.backgroundColor = UIColor.gray
        removeShadow()
    }
    
    func removeShadow() {
        addToWatchlistButton.layer.shadowColor = UIColor.white.cgColor
        addToWatchlistButton.layer.shadowOffset = .zero
        addToWatchlistButton.layer.shadowOpacity = 0
        addToWatchlistButton.layer.shadowRadius = 0
    }
    
    func notAddedYetToWatchlist() {
        addToWatchlistButton.setTitle("Add to your Watchlist", for: .normal)
        addToWatchlistButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        addToWatchlistButton.backgroundColor = UIColor(r: 259, g: 57, b: 53)
        setupShadow()
    }
    
    func setupShadow() {
        addToWatchlistButton.layer.shadowColor = UIColor.red.cgColor
        addToWatchlistButton.layer.shadowOffset = .zero
        addToWatchlistButton.layer.shadowOpacity = 0.5
        addToWatchlistButton.layer.shadowRadius = 12
        addToWatchlistButton.layer.masksToBounds = false
    }
}
