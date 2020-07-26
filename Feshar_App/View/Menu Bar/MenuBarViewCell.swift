//
//  NewHomeViewCell.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/30/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class MenuBarViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuBarLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            menuBarLabel.backgroundColor = isSelected ? UIColor(r: 229, g: 57, b: 53) : .white
            menuBarLabel.textColor = isSelected ? .white: UIColor(r: 101, g: 101, b: 137)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            menuBarLabel.backgroundColor = isHighlighted ? UIColor(r: 229, g: 57, b: 53) : .white
            menuBarLabel.textColor = isHighlighted ? .white: UIColor(r: 101, g: 101, b: 137)
        }
    }
    
}

