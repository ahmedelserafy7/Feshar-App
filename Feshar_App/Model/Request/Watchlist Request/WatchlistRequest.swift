//
//  AddToWatchlistRequest.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/11/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct WatchlistRequest: Codable {
    let media_type: String
    let media_id: Int
    let watchlist: Bool
}
