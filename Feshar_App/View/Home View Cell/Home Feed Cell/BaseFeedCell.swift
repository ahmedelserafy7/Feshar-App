//
//  HomeFeedCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/12/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit
import FBSDKShareKit

class BaseFeedCell: UICollectionViewCell {
   
    lazy var tableView: UITableView = { [unowned self] in
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var searchBar: UISearchBar = { [unowned self] in
       let sb = UISearchBar()
        sb.placeholder = "Find a movie..."
        let textfield = sb.value(forKey: "searchField") as? UITextField
        textfield?.backgroundColor = UIColor(r: 241, g: 241, b: 242)
        sb.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        sb.delegate = self
        return sb
    }()
    
    fileprivate let cellId = "cellId"
    var filteredMovies = [Movie]()
    var movies = [Movie]()
    var homeViewController: HomeViewController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setupViews()
        searchBarSetup()
        fetchMovies()
    }
    
    func setupViews() {
        
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomeCell.self, forCellReuseIdentifier: cellId)
        
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func searchBarSetup() {
        tableView.keyboardDismissMode = .onDrag
        searchBar.frame = CGRect(x: 0, y: 0, width: 0, height: 44)
        tableView.tableHeaderView = searchBar
    }
    
    func fetchMovies() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseFeedCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeCell
        
        let movie = self.filteredMovies[indexPath.section]
        cell.movie = movie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.contentView.backgroundColor = UIColor(r: 251, g: 251, b: 251)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let action = addMovieToWatchlistAction(by: indexPath) else { return nil }
        
        let config =  UISwipeActionsConfiguration(actions: [action])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    func addMovieToWatchlistAction(by indexPath: IndexPath)-> UIContextualAction? {
        
        guard let id = self.filteredMovies[indexPath.section].id else { return nil }
        Client.movieId = id
        
        let action = UIContextualAction(style: .normal, title: "Add to your Watchlist") { act, view, success in
            Watchlist.shared.postWatchlist(id: Client.movieId, watchlist: true)
            success(true)
        }
        
        checkIfAddedToWatchlist(by: id)
        
        action.backgroundColor = UIColor(r: 3, g: 37, b: 65)
        action.image = UIImage(systemName: "bookmark.fill")
        
        return action
    }
    
    func checkIfAddedToWatchlist(by id: Int) {
        Watchlist.shared.getWatchlistDetails { [unowned self] movies in
            DispatchQueue.main.async {
                movies.forEach { movie in
                    if id == movie.id! {
                        
                        let alert = UIAlertController(title: "Message", message: "You've added this movie to your Watchlist earlier!", preferredStyle: .alert)
                        
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alert.addAction(alertAction)
                        
                        self.homeViewController?.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let twitter = shareOnTwitter(by: indexPath)
        let facebook = shareOnFacebook(by: indexPath)
        
        let config = UISwipeActionsConfiguration(actions: [twitter, facebook])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(identifier: "details") as! DetailsViewController
        
        let movie = filteredMovies[indexPath.section]
        Client.movieId = movie.id ?? 0
    
        homeViewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

