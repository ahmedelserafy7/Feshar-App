//
//  Login.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/22/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class Login {
    
    static let shared = Login()
    
    func login(userName: String, password: String, completion: @escaping(Bool, Error?)->()) {
        
        let url = Client.AccessPoint.login.url
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = LoginRequest(username: userName, password: password, requestToken: Client.Auth.requestToken)
        request.httpBody = try! JSONEncoder().encode(body)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                completion(false, err)
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let requestTokenResponse = try decoder.decode(RequestTokenResponse.self, from: data)
                
                Client.Auth.requestToken = requestTokenResponse.requestToken
                print("from login \(requestTokenResponse)")
                completion(true, nil)
                
            } catch let err {
                completion(false, err)
            }
        }
            
        task.resume()
    }
}
