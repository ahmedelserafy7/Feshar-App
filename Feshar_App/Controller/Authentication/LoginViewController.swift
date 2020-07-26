//
//  HomeViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 3/23/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let redBackgroundView: UIView = {
        let bv = UIView()
        bv.backgroundColor = UIColor(r: 255, g: 0, b: 31)
        bv.layer.cornerRadius = 16
        bv.layer.masksToBounds = true
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()
    
    var activityIndicator: NVActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupShadowLoginButton()
        handleOrientation()
        handleKeyboardDismiss()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        check()
    }
    
    func handleRequestToken(success: Bool, err: Error?) {
        if success {
            DispatchQueue.main.async {
                Login.shared.login(userName: self.userNameTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: self.handleLoginRequest(success:err:))
            }
        }
    }
    
    func handleLoginRequest(success: Bool, err: Error?) {
        print("request token is \(Client.Auth.requestToken)")
        if success {
            Session.shared.getSessionId(completion: self.getSession(success:error:))
        } else {
            self.wrongLogin(with: "Invaild Credentials", and: "There is something wrong, please try login again!")
        }
    }
    
    func getSession(success: Bool, error: Error?) {
        DispatchQueue.main.async {
            if success {
                print("session id is \(Client.Auth.sessionId)")
                self.activityIndicator!.stopAnimating()
                self.navigateToHomeVC()
            } else {
                self.wrongLogin(with: "Invaild Credentials", and: "There is something wrong, please try login again!")
            }
        }
    }
    
    func navigateToHomeVC() {
        let tabBarController = storyboard?.instantiateViewController(identifier: "tabBar") as! UITabBarController
        let window = UIApplication.shared.connectedScenes.filter{$0.activationState == .foregroundActive}.map{$0 as? UIWindowScene}.compactMap{$0}.first?.windows.filter{$0.isKeyWindow}.first
        window?.rootViewController = tabBarController
    }
}
