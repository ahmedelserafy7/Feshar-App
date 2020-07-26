//
//  RequestToken.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/22/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class RequestToken {
    
    static let shared = RequestToken()
    
    func getRequestToken(completion: @escaping(Bool, Error?)->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getRequestToken.url
        
        let task = sharedSession.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch movies from URL, and the reason is:\n\(err.localizedDescription)")
                completion(false, err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let requestTokenResponse = try decoder.decode(RequestTokenResponse.self, from: data)
                
                Client.Auth.requestToken = requestTokenResponse.requestToken
                completion(true, nil)
                
            } catch let err {
                print(err)
                completion(false, err)
            }
        }
        
        task.resume()
    }
}

