//
//  MovieDetails.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class MovieDetails {
    
    static let shared = MovieDetails()
    
    func fetchDetails(_ completion: @escaping(Bool, Error?)->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getMovieDetails.url
        let task = sharedSession.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err.localizedDescription)
                completion(false, err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                
                let movieDetails = try decoder.decode(MovieDetailsResponse.self, from: data)
                movieDetails.id = Client.movieId
                Client.movieDetails = movieDetails
                
                completion(true, nil)
                
            } catch let err {
                print(err)
                completion(false, err)
            }
        }
        
        task.resume()
    }
}

