//
//  LoginRequest.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/8/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

struct LoginRequest: Codable {
    
    let username: String?
    let password: String?
    let requestToken: String
    
   enum CodingKeys: String, CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
}
