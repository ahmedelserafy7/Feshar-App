//
//  Genres.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class Genres {
    
    static let shared = Genres()
    
    func fetchGenres(completion: @escaping ([Genre])->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getGenres.url
        let task = sharedSession.dataTask(with: url) { data, response, err in
            
            if let err = err {
                print(err.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                
                let movieGenres = try decoder.decode(MovieGenres.self, from: data)
                let genres = movieGenres.genres
                
                completion(genres)
            } catch let err {
                print(err)
            }
        }
        
        task.resume()
    }
}
