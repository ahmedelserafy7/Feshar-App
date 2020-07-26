//
//  SessionRequest.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/14/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct SessionRequest: Codable {
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
    }
}
