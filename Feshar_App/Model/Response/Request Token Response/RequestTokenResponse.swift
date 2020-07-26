//
//  RequestTokenResponse.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/8/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct RequestTokenResponse: Codable {
    
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
