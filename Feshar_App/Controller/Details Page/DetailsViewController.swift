//
//  HomeViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/29/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: CustomImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieOverviewTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addToWatchlistButton: UIButton!
    
    fileprivate let collectionViewCellId = "collectionViewCellId"
    var cast: [Cast]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        getMovieDetails()
        addedToWatchlistCheck()
        observeDeletingMovie()
        getCast()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func getMovieDetails() {
        MovieDetails.shared.fetchDetails(fetchDetails)
    }
    
    var blackBackgroundView = UIView()
    var movieGenreNames = [String]()
    func fetchDetails(success: Bool, error: Error?) {
        if success {
            self.getViews()
            self.getMovieGenre()
            setupTextView()
        }
    }
    
    func addedToWatchlistCheck() {
        Watchlist.shared.getWatchlistDetails { [weak self] movies in
            DispatchQueue.main.async {
                self?.setupShadow()
                for movie in movies {
                    if movie.id! == Client.movieId {
                        self?.addedMovieToWatchlist()
                    }
                }
            }
        }
    }
    
    func observeDeletingMovie() {
        // listen to watchlist movie when deleting it in order to change login button color.
        NotificationCenter.default.addObserver(self, selector: #selector(updateLoginButton), name: WatchlistViewController.updateLoginButtonNotificationName, object: nil)
    }
    
    @objc func updateLoginButton() {
        deleteFromWatchlist()
    }
    
    func deleteFromWatchlist() {
        Client.deletedMovieIds.forEach { id in
            if Client.movieId == id {
                notAddedYetToWatchlist()
            } else {
                addedMovieToWatchlist()
            }
        }
    }
    
    func getCast() {
        MovieCast.shared.fetchCast { [weak self] cast in
            DispatchQueue.main.async {
                self?.cast = cast
                self?.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapAddToWatchlist(_ sender: Any) {
        if addToWatchlistButton.currentTitle == "Add to your Watchlist" {
            addedMovieToWatchlist()
            Watchlist.shared.postWatchlist(id: Client.movieId, watchlist: true)
        } else {
            notAddedYetToWatchlist()
            Watchlist.shared.postWatchlist(id: Client.movieId, watchlist: false)
        }
    }
}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! CastCell
        
        guard let cast = cast?[indexPath.item] else { return UICollectionViewCell() }
        cell.castInfo = cast
        
        return cell
    }
}

