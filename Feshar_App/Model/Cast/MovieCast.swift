//
//  MovieCast.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class MovieCast {
    
    static let shared = MovieCast()
    
    func fetchCast(completion: @escaping([Cast])->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getCast.url
        let task = sharedSession.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                let credits = try decoder.decode(Credits.self, from: data)
                let cast = credits.cast
                completion(cast)
            } catch let err {
                print(err)
            }
        }
        
        task.resume()
    }
}
