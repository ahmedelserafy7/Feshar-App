//
//  Movie.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/31/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct ListOfMovies: Codable {
    
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
   
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
