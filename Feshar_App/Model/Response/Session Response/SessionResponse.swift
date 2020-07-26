//
//  RequestSessionResponse.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/10/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct SessionResponse: Codable {
    
    let success: Bool
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}

