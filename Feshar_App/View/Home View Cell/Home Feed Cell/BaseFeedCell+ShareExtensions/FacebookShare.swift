//
//  FacebookShare.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit
import FBSDKShareKit

extension BaseFeedCell: SharingDelegate {
    
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        print("Completed")
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print("Failed")
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        print("Canceled")
    }
    
    func shareOnFacebook(by indexPath: IndexPath)-> UIContextualAction {
        
        let share = UIContextualAction(style: .normal, title: "Share") { (ac, view, success) in
            
            let movie = self.filteredMovies[indexPath.section]
            guard let movieName = movie.title else { return }
            
            let baseUrl = "http://image.tmdb.org/t/p/w300"
            let posterUrlString = baseUrl + (movie.posterPath ?? "")
            
            self.share(with: movieName, and: posterUrlString)
            
            success(true)
        }
        
        share.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
        share.backgroundColor = UIColor(r: 59, g: 91, b: 152)
        
        return share
    }
    
    func share(with title: String, and imageUrlString: String) {
        
        let share = ShareLinkContent()
        share.quote = title
        
        guard let url = URL(string: imageUrlString) else { return }
        share.contentURL = url
        
        ShareDialog(fromViewController: nil, content: share, delegate: self).show()
    }
}
