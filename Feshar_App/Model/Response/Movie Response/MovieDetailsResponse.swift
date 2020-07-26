//
//  Details.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/9/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class MovieDetailsResponse: Codable {
    
    var id: Int?
    let posterPath: String
    let overview: String
    let voteAverage: Double
    let originalTitle: String
    let title: String
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
        case originalTitle = "original_title"
        case title
        case genres
    }
}
