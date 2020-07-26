//
//  MovieTableViewCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/30/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    let movieView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let movieImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDetailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(r: 166, g: 166, b: 166)
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imdbLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moviePlotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(r: 251, g: 251, b: 251)
        
        setupViews()
        customizeImageView()
    }
    
    func setupViews() {
        
        selectionStyle = .none
        
        addSubview(movieView)
        addSubview(movieImageView)
        movieView.addSubview(movieNameLabel)
        movieView.addSubview(movieDetailsLabel)
        movieView.addSubview(imdbLabel)
        movieView.addSubview(movieRateLabel)
        movieView.addSubview(moviePlotLabel)
        
        NSLayoutConstraint.activate([
            movieView.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            movieView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            movieView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: 12),
            movieImageView.widthAnchor.constraint(equalToConstant: 108),
            movieImageView.heightAnchor.constraint(equalToConstant: 127)
        ])
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieView.topAnchor, constant: 46),
            movieNameLabel.leadingAnchor.constraint(equalTo: movieView.leadingAnchor, constant: 147),
            movieNameLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            movieDetailsLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 3),
            movieDetailsLabel.leadingAnchor.constraint(equalTo: movieNameLabel.leadingAnchor),
            movieDetailsLabel.trailingAnchor.constraint(equalTo: movieNameLabel.trailingAnchor)
        ])
       
        NSLayoutConstraint.activate([
            imdbLabel.topAnchor.constraint(equalTo: movieDetailsLabel.bottomAnchor, constant: 3),
            imdbLabel.leadingAnchor.constraint(equalTo: movieDetailsLabel.leadingAnchor),
            imdbLabel.widthAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            movieRateLabel.topAnchor.constraint(equalTo: imdbLabel.topAnchor),
            movieRateLabel.leadingAnchor.constraint(equalTo: imdbLabel.trailingAnchor, constant: 6),
            movieRateLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            moviePlotLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 9),
            moviePlotLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
            moviePlotLabel.trailingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: -12),
            moviePlotLabel.bottomAnchor.constraint(equalTo: movieView.bottomAnchor, constant: -9)
        ])
        
        
    }
    
    var movie: Movie? {
        didSet {
            
            guard let movie = movie else { return }
            movieNameLabel.text = movie.title
            movieDetailsLabel.text = movie.releaseDate
            
            guard let movieRate = movie.voteAverage else { return }
            movieRateLabel.text = "\(movieRate)"
            
            moviePlotLabel.text = movie.overview
            
            guard let posterPath = movie.posterPath else { return }
            let posterUrl = Client.imageBaseUrl + posterPath
            movieImageView.loadImageFromCacheWithURLString(urlString: posterUrl)
        }
    }
    
    
    func customizeImageView() {
        movieImageView.layer.cornerRadius = 16
        movieImageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
