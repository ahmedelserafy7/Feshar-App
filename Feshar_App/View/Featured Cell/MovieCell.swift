//
//  VideoCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/4/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieImageView: CustomImageView!
    
    var movie: Movie? {
        didSet {
            
            guard let movie = movie else { return }
            movieNameLabel.text = movie.title
            movieReleaseDateLabel.text = movie.releaseDate
            
            guard let posterPath = movie.posterPath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            movieImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
            
            movieImageView.layer.cornerRadius = 16
            movieImageView.layer.masksToBounds = true
        }
    }
}

