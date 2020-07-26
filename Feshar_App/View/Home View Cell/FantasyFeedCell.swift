//
//  FantasyFeedCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class FantasyFeedCell: BaseFeedCell {
    
    override func fetchMovies() {
        Service.sharedInstance.fetchMovies { results in
            DispatchQueue.main.async {
                results.forEach { result in
                    result.genreIds?.forEach { [unowned self] id in
                        if id == 14 {
                            self.movies.append(result)
                            self.filteredMovies = self.movies
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}