//
//  Cache+helper.swift
//  Feshar_App
//
//  Created by Elser_10 on 4/7/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageURLString: String?
    func loadImageFromCacheWithURLString(urlString: String) {
        
        self.image = nil
        imageURLString = urlString
        
        if let image = imageCache.object(forKey: urlString as AnyObject) {
            self.image = image as? UIImage
        }
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                if let imageData = data {
                    guard let image = UIImage(data: imageData) else { return }
                    if self.imageURLString == urlString {
                        self.image = image
                    }
                    
                    imageCache.setObject(image, forKey: urlString as AnyObject)
                }
                
            }
            
        }.resume()
    }
}

