//
//  ProfileViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/6/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let profile = Profile(name: ["Mobile", "Email", "Favorite Movie", "Favorite Show"], info: ["+20 1276369320", "ahmedelserafy@feshar.com", "For a few dollars more", "Saturday Night Live"])
    fileprivate let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.isTranslucent = false
        setupLogoImageView()
    }
    
    func setupLogoImageView() {
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 37)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
    
    @IBAction func didTapWatchlist(_ sender: Any) {
        let watchlistViewController = storyboard?.instantiateViewController(identifier: "watchlist") as! WatchlistViewController
        self.navigationController?.pushViewController(watchlistViewController, animated: true)
    }
    
    @IBAction func didTapLogOut(_ sender: Any) {
        logOut()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profile.name.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileCell
        
        let name = profile.name[indexPath.section]
        cell.nameLabel.text = name
        
        let info = profile.info[indexPath.section]
        cell.detailsLabel.text = info
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        header.contentView.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let sectionHeight = heightFor(section)
        return sectionHeight
    }
    
    func heightFor(_ section: Int)-> CGFloat {
        
        var sectionHeight = CGFloat()
        if section == 1 {
            sectionHeight = 23
        } else if section == 2 {
            sectionHeight = 26
        } else if section == 3 {
            sectionHeight = 21
        }
        
        return sectionHeight
    }
}
