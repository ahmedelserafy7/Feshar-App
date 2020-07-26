//
//  Movie.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/23/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let voteAverage: Double?
    let posterPath: String?
    let originalTitle: String?
    let mediaType: String?
    let releaseDate: String?
    let name: String?
    let genreIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case name
        case genreIds = "genre_ids"
    }
}
