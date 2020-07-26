//
//  MovieService.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/25/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class Service {
    
    static let sharedInstance = Service()
    
    func fetchMovies(completion: @escaping([Movie])->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getMovies.url
        let task = sharedSession.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch movies from URL, and the reason is:\n\(err.localizedDescription)")
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                let listOfMovies = try decoder.decode(ListOfMovies.self, from: data)
                let movies = listOfMovies.results
                completion(movies)
            } catch let err {
                print(err)
            }
        }
        
        task.resume()
    }
    
    func fetchTvShows(completion: @escaping([Movie])->()) {
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let url = Client.AccessPoint.getTvShows.url
        let task = sharedSession.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print("Failed to fetch movies from URL, and the reason is:\n\(err.localizedDescription)")
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let listOfMovies = try decoder.decode(ListOfMovies.self, from: data)
                let tvShows = listOfMovies.results
                completion(tvShows)
                
            } catch let err {
                print(err)
            }
        }
        
        task.resume()
    }
}
