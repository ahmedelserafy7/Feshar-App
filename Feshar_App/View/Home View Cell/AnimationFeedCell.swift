//
//  AnimationFeedCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class AnimationFeedCell: BaseFeedCell {
    
    override func fetchMovies() {
        Service.sharedInstance.fetchMovies { results in
            results.forEach { result in
                result.genreIds?.forEach { id in
                    if id == 16 {
                        self.movies.append(result)
                        self.filteredMovies = self.movies
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
}

