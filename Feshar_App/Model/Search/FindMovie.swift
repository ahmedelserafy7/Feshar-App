//
//  FindMovie.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension BaseFeedCell: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter{ (movie) -> Bool in
                guard let name = movie.title else { return false }
                print(name)
                return name.lowercased().contains(searchText.lowercased())
            }
        }
        
        tableView.reloadData()
    }
}
