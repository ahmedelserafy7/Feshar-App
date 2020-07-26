//
//  HomeTableViewCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/1/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class WatchlistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: CustomImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDetails: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    var watchlist: Movie? {
        didSet {
            
            guard let watchlist = watchlist else { return }
            movieName.text = watchlist.title
            movieDetails.text = watchlist.releaseDate
            movieRate.text = "\(watchlist.voteAverage ?? 0)"
                   
                   
            guard let posterPath = watchlist.posterPath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            movieImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
            
            movieImageView.layer.cornerRadius = 16
            movieImageView.layer.masksToBounds = true
        }
    }
}
