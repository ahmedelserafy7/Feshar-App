//
//  VideoCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/19/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class TvCell: UICollectionViewCell {
    
    @IBOutlet weak var tvImageView: CustomImageView!
    
    var serie: Movie? {
        didSet {
            
            guard let serie = serie else { return }
            
            guard let posterPath = serie.posterPath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            tvImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
            
            tvImageView.layer.cornerRadius = 16
            tvImageView.layer.masksToBounds = true
        }
    }
}
