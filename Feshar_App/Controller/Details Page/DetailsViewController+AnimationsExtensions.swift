//
//  DetailsZoomImageViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    @objc func handleZoom() {
        
        posterImageView.alpha = 0
        guard let startingFrame = posterImageView.superview?.convert(posterImageView.frame, to: nil) else { return }
        
        let zoomImageView = UIImageView()
        zoomImageView.frame = startingFrame
        
        zoomImageView.image = posterImageView.image
        zoomImageView.isUserInteractionEnabled = true
        zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomOut)))
        zoomImageView.clipsToBounds = true
        zoomImageView.contentMode = .scaleToFill
        
        guard let keyWindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first else { return }
        
        blackBackgroundView = UIView(frame: keyWindow.frame)
        blackBackgroundView.alpha = 0
        blackBackgroundView.backgroundColor = .black
        
        keyWindow.addSubview(blackBackgroundView)
        
        keyWindow.addSubview(zoomImageView)
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            
            self.blackBackgroundView.alpha = 1
            
            // h2 = h1/w1 * w2
            let height = (startingFrame.height / startingFrame.width) * keyWindow.frame.width
            //let y = (keyWindow.frame.height / 2) - (height / 2)
            zoomImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            zoomImageView.center = keyWindow.center
            
        }, completion: nil)
    }
    
    @objc func handleZoomOut(tapGesture: UITapGestureRecognizer) {
        
        guard let zoomOutImageView = tapGesture.view else { return }
        guard let startingFrame = posterImageView.superview?.convert(posterImageView.frame, to: nil) else { return }
        
        zoomOutImageView.layer.cornerRadius = 12
        zoomOutImageView.clipsToBounds = true
        
        blackBackgroundView.alpha = 1
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            
            zoomOutImageView.frame = startingFrame
            self.blackBackgroundView.alpha = 0
            
        }) { _ in
            zoomOutImageView.removeFromSuperview()
            self.posterImageView.alpha = 1
        }
    }
}
