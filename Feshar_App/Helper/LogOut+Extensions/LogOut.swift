//
//  Logout.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func logOut() {
        DeleteSession.sharedInstance.logOut {
            DispatchQueue.main.async {
                self.showAlertAction(title: "Alert", message: "Your session has been expired!")
                self.delay(2) {
                    self.dismiss(animated: true, completion: nil)
                    
                    let loginViewController = self.storyboard?.instantiateViewController(identifier: "login") as! LoginViewController
                    loginViewController.modalPresentationStyle = .fullScreen
                    self.present(loginViewController, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    func showAlertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func delay(_ sec: Double, completion: @escaping()->()) {
        let deadline = DispatchTime.now() + (sec * Double(NSEC_PER_SEC) / Double(NSEC_PER_SEC))
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: completion)
    }
}
