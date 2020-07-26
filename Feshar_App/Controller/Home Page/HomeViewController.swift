//
//  NewHomeViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/30/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuBar: MenuBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var genres = [Genre]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupMenuBar()
        setupCollectionView()
        registerCollectionView()
        getGenres()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
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
    
    func setupMenuBar() {
        menuBar.homeController = self
        menuBar.showCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
    }
    
    func getGenres() {
        Genres.shared.fetchGenres { [unowned self] genres in
            self.genres = genres
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @IBAction func didTapWatchlist(_ sender: Any) {
        let watchlistViewController = storyboard?.instantiateViewController(identifier: "watchlist") as! WatchlistViewController
        self.navigationController?.pushViewController(watchlistViewController, animated: true)
    }
    
    @IBAction func didTapLogOut(_ sender: Any) {
        logOut()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = checkFeedCell(collectionView: collectionView, by: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scroll(to newItem: Int) {
        let indexPath = IndexPath(item: newItem, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition(), animated: false)
    }
}
