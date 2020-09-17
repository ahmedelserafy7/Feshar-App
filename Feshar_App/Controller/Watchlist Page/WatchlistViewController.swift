//
//  File.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/31/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class WatchlistViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var watchlists = [Movie]()
    static let updateLoginButtonNotificationName = NSNotification.Name("updateLoginButton")
    fileprivate let tableViewCellId = "tableViewCellId"
    override func viewDidLoad() {
        
        setupNavBar()
        addRefreshControl()
        // to update automatically
        getMoviesWatchlist()
    }
    
    func setupNavBar() {
        setupLogoImageView()
        setupLeftBarButton()
    }
    
    func setupLogoImageView() {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 37)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
    
    func setupLeftBarButton() {
        let leftButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(handleArrowButton))
        leftButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    @objc func handleArrowButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func handleRefresh() {
        getMoviesWatchlist()
    }
    
    func getMoviesWatchlist() {
        Watchlist.shared.getWatchlistDetails { [weak self] movies in
            self?.watchlists = movies.reversed()
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
}

extension WatchlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return watchlists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.contentView.backgroundColor = UIColor(r: 251, g: 251, b: 251)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as! WatchlistTableViewCell
        
        let watchlist = watchlists[indexPath.section]
        cell.watchlist = watchlist
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            guard let id = self.watchlists[indexPath.section].id else { return }
            Client.deletedMovieIds.append(id)
            
            Watchlist.shared.postWatchlist(id: id, watchlist: false)
            self.handleRefresh()

            NotificationCenter.default.post(name: WatchlistViewController.updateLoginButtonNotificationName, object: nil)
        }
    }
    
}
