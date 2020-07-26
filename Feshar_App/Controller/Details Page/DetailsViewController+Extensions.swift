//
//  SetupDetailsControllerViews.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func setupNavBar() {
        changeBackArrowButton()
        setupLogoImageView()
        setupRightBarButton()
    }
    
    func changeBackArrowButton() {
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    func setupLogoImageView() {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 37)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
    
    func setupRightBarButton() {
        let wandButtonItem = UIBarButtonItem(image: UIImage(systemName: "wand.and.stars"), style: .plain, target: self, action: #selector(handleWatchlist))
        wandButtonItem.tintColor = .black
        
        navigationItem.rightBarButtonItem = wandButtonItem
    }
    
    @objc func handleWatchlist() {
        let watchlistViewController = storyboard?.instantiateViewController(identifier: "watchlist") as! WatchlistViewController
        self.navigationController?.pushViewController(watchlistViewController, animated: true)
    }
    
    func getViews() {
        
        DispatchQueue.main.async {
            
            self.movieNameLabel.text = Client.movieDetails?.title
            
            self.setupPosterImageView()
            guard let posterPath = Client.movieDetails?.posterPath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            self.posterImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
            
            self.movieRateLabel.text = "\(Client.movieDetails?.voteAverage ?? 0)"
        }
    }
    
    func setupPosterImageView() {
        self.posterImageView.layer.cornerRadius = 12
        self.posterImageView.clipsToBounds = true
        
        self.posterImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleZoom)))
    }
    
    func getMovieGenre() {
        Genres.shared.fetchGenres { [unowned self] genres in
            genres.forEach { genre in
                Client.movieDetails?.genres.forEach({ movieGenre in
                    if movieGenre.id == genre.id {
                        DispatchQueue.main.async {
                            guard let movieGenreName = movieGenre.name else { return }
                            self.movieGenreNames.append(movieGenreName)
                            
                            let genreNameWithPipe = self.movieGenreNames.map{$0}.joined(separator: " | ")
                            self.movieGenreLabel.text = genreNameWithPipe
                        }
                    }
                })
            }
        }
    }
    
    
    func setupTextView() {
        DispatchQueue.main.async {
            self.movieOverviewTextView.isEditable = false
            self.movieOverviewTextView.isUserInteractionEnabled = false
            self.customizeTextView()
        }
    }
    
    func customizeTextView() {
        let attributedText = NSMutableAttributedString(string: "Description", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 27)])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let range = NSMakeRange(0, attributedText.string.count)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
        
        
        let plot = "\n\n\(Client.movieDetails?.overview ?? "")"
        attributedText.append(NSAttributedString(string: plot, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
        
        self.movieOverviewTextView.attributedText = attributedText
    }
}

