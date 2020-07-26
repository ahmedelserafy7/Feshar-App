//
//  CastCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/30/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet weak var starImageView: CustomImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    var castInfo: Cast? {
        didSet {
            
            guard let cast = castInfo else { return }
            nameLabel.text = cast.name
            characterLabel.text = cast.character
            
            guard let posterPath = cast.profilePath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            starImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
        }
    }
}
