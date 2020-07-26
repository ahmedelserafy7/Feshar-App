//
//  GetSessionId.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/17/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
     func getSessionId(completion: @escaping(Bool, Error?)->()) {
        
        let url = Client.AccessPoint.getSession.url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = LoginRequest(username: nil, password: nil, requestToken: Client.Auth.requestToken)
        urlRequest.httpBody = try! JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let err = error {
                print(err)
                completion(false, err)
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                let sessionResponse = try decoder.decode(SessionResponse.self, from: data)
                Client.Auth.sessionId = sessionResponse.sessionId
                
                completion(true, nil)
                print("get request token to sessionId \(sessionResponse.sessionId)")
                
            } catch let err {
                print(err)
                completion(false, err)
            }
            
        }.resume()
    }
}

