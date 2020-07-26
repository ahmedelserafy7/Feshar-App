//
//  FeaturedViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/4/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class FeaturedViewController: UITableViewController {
    
    enum ReuseIdentifier {
        
        case movieId, tvId
        case movieCVId, tvCVId
        
        var stringValue: String {
            switch self {
            case .movieId: return "movieId"
            case .tvId: return "tvId"
            case .movieCVId: return "movieCVId"
            case .tvCVId: return "tvCVId"
            }
        }
    }
    
    var titles = ["Movies", "TV"]
    var movies: [Movie]?
    var series: [Movie]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticTableViewHeight()
        setupNavBar()
        fetchMovies()
        fetchTvShows()
    }
    
    func automaticTableViewHeight() {
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupNavBar() {
        setupLogoImageView()
    }
    
    func setupLogoImageView() {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 37)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
    
    func fetchMovies() {
        Service.sharedInstance.fetchMovies { [unowned self] results in
            DispatchQueue.main.async {
                self.movies = results
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchTvShows() {
        Service.sharedInstance.fetchTvShows { results in
            DispatchQueue.main.async {
                self.series = results
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func didTapLogOut(_ sender: Any) {
        logOut()
    }
    
    @IBAction func didTapWatchlist(_ sender: Any) {
        let watchlistViewController = storyboard?.instantiateViewController(identifier: "watchlist") as! WatchlistViewController
        self.navigationController?.pushViewController(watchlistViewController, animated: true)
    }
}

extension FeaturedViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.movieId.stringValue, for: indexPath) as! FeaturedViewCell
            cell.set(cell.collectionView, by: self)
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.tvId.stringValue, for: indexPath) as! FeaturedViewCell
            cell.set(cell.tvCollectionView, by: self)
            
            return cell
        }
    }
}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = collectionView.tag == 0 ? movies?.count ?? 0 : series?.count ?? 0
        return count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.movieCVId.stringValue, for: indexPath) as! MovieCell
            
            guard let movie = movies?[indexPath.item] else { return UICollectionViewCell() }
            cell.movie = movie
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.tvCVId.stringValue, for: indexPath) as! TvCell
            
            guard let serie = series?[indexPath.item] else { return UICollectionViewCell() }
            cell.serie = serie
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.tag == 0 {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let detailsViewController = storyBoard.instantiateViewController(identifier: "details") as! DetailsViewController
            
            guard let movie = movies?[indexPath.item] else { return }
            Client.movieId = movie.id ?? 0
            
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
    
}


