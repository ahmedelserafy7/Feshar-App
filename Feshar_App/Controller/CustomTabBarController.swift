//
//  CustomeTabBarController.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/31/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    @IBOutlet weak var fTabBar: UITabBar!
    override func viewDidLoad() {
        tabBar.tintColor = UIColor(r: 255, g: 15, b: 44)
        tabBar.unselectedItemTintColor = UIColor(r: 70, g: 70, b: 70)
    }
}
