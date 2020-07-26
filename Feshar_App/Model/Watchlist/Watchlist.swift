//
//  GetWatchlist.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/20/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class Watchlist {
    
    static let shared = Watchlist()
    
    func getWatchlistDetails(completion: @escaping([Movie])->()) {
        
        let url = Client.AccessPoint.getWatchlistDetails.url
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let detailsResponse = try decoder.decode(WatchlistDetailsResponse.self, from: data)
                
                self.getMovieWatchlist(id: detailsResponse.id, completion: completion)
                
            } catch let err {
                print(err)
            }
        }.resume()
    }
    
    func getMovieWatchlist(id: Int, completion: @escaping([Movie])->()) {
        
        let url = Client.AccessPoint.getWatchlist.url
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let task = sharedSession.dataTask(with: url) { (data, response, err) in
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
    
    func postWatchlist(id: Int, watchlist: Bool) {
        
        let url = Client.AccessPoint.postWatchlist.url
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let body = WatchlistRequest(media_type: "movie", media_id: id, watchlist: watchlist)
        request.httpBody = try! JSONEncoder().encode(body)
        
        let sharedSession = URLSession.shared
        sharedSession.configuration.allowsCellularAccess = false
        
        let task = sharedSession.dataTask(with: request) { (data, response, err) in
            
            if let error = err {
                print(error.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                
                let addToWatchlistResponse = try decoder.decode(WatchlistResponse.self, from: data)
                print(addToWatchlistResponse)
                
            } catch let err {
                print(err)
            }
        }
        
        task.resume()
    }
}
