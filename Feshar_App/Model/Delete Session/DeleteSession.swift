//
//  DeleteSession.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/14/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class DeleteSession {
    static let sharedInstance = DeleteSession()
    
    func logOut(completion: @escaping()->()) {
        
        let url = Client.AccessPoint.deleteSession.url
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        // with ";charset=utf-8" or without it
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = SessionRequest(sessionId: Client.Auth.sessionId)
        request.httpBody = try! JSONEncoder().encode(body)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            /*if let err = error {
                print(err.localizedDescription)
            }*/
            
            Client.Auth.requestToken = ""
            Client.Auth.sessionId = ""
            completion()
            
          /*  guard let data = data else { return }
            
            do {
                Client.Auth.requestToken = ""
                Client.Auth.sessionId = ""
//                let decoder = JSONDecoder()
//                let sessionResponse = try decoder.decode(DeleteSessionResponse.self, from: data)
//                print("session response \(sessionResponse)")
                completion()
                
            } catch let err {
                print(err)
            }*/
        }
        
        task.resume()
    }
}
