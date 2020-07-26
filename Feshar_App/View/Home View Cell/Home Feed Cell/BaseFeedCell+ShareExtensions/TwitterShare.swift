//
//  TwitterShare.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension BaseFeedCell {
    
    func shareOnTwitter(by indexPath: IndexPath)-> UIContextualAction {
        
        let share = UIContextualAction(style: .normal, title: "Share") { (ac, view, success) in
            print("ok shared")
            
            let movie = self.filteredMovies[indexPath.section]
            guard let movieName = movie.title else { return }
            
            let baseUrl = "http://image.tmdb.org/t/p/w300"
            let posterUrlString = baseUrl + (movie.posterPath ?? "")
            
            let shareString = "https://twitter.com/intent/tweet?text=\(movieName)&url=\(posterUrlString)"
            guard let escapeShareString = shareString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
            guard let shareUrl = URL(string: escapeShareString) else { return }
            
            UIApplication.shared.open(shareUrl, options: [:], completionHandler: nil)
            success(true)
        }
        
        share.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
        share.backgroundColor = UIColor(r: 49, g: 169, b: 243)
        
        return share
    }
}
