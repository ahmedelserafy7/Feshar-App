//
//  Client.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/22/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import Foundation

class Client {
    
    static let api = "16f2fdf478c3fad6960e87485999b480"
    static let imageBaseUrl = "http://image.tmdb.org/t/p/w300"
    static var movieId = Int()
    static var movieDetails: MovieDetailsResponse?
    static var deletedMovieIds = [Int]()
    
    struct Auth {
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum AccessPoint {
        
        static let base = "https://api.themoviedb.org/3"
        static let authenticationToken = "/authentication/token"
        static let authenticationSession = "/authentication/session"
        static let apiKeyParam = "?api_key=\(Client.api)"
        
        case getRequestToken
        case login
        case getSession
        case getGenres
        case getMovies
        case getMovieDetails
        case getCast
        case getTvShows
        case getWatchlistDetails
        case getWatchlist
        case postWatchlist
        case deleteSession
        
        var stringValue: String {
            switch self {
            case .getRequestToken: return AccessPoint.base + AccessPoint.authenticationToken + "/new" + AccessPoint.apiKeyParam
            case .login: return AccessPoint.base + AccessPoint.authenticationToken + "/validate_with_login" + AccessPoint.apiKeyParam
            case .getSession: return AccessPoint.base + AccessPoint.authenticationSession + "/new" + AccessPoint.apiKeyParam
            case .getGenres: return AccessPoint.base + "/genre/movie/list" + AccessPoint.apiKeyParam + "&language=en-US"
            case .getMovies: return AccessPoint.base + "/discover/movie" + AccessPoint.apiKeyParam + "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
            case .getMovieDetails: return AccessPoint.base + "/movie/" + "\(Client.movieId)" + AccessPoint.apiKeyParam + "&language=en-US"
                case .getWatchlistDetails: return AccessPoint.base + "/account" + AccessPoint.apiKeyParam + "&session_id=" + Auth.sessionId
            case .getCast: return AccessPoint.base + "/movie/\(movieId)/credits" + AccessPoint.apiKeyParam
            case .getTvShows: return AccessPoint.base + "/discover/tv" + AccessPoint.apiKeyParam + "&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false"
            case .getWatchlist: return AccessPoint.base + "/account/1/watchlist/movies" + AccessPoint.apiKeyParam + "&language=en-US&session_id=" + Auth.sessionId + "&sort_by=created_at.asc&page=1"
            case .postWatchlist: return AccessPoint.base + "/account/1/watchlist" + AccessPoint.apiKeyParam + "&session_id=" + Auth.sessionId
            case .deleteSession: return AccessPoint.base + "/authentication/session" + AccessPoint.apiKeyParam
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
