//
//  CastInfo.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/30/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct Cast: Codable {
    
    let cast_id: Int?
    let name: String?
    let character: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case cast_id
        case name
        case character
        case profilePath = "profile_path"
    }
}

