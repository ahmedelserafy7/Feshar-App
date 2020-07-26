//
//  Extensions.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/25/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension UIColor {
     convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
