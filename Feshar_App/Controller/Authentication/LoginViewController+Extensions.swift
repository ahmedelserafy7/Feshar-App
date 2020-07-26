//
//  SetupViewsLoginViewController.swift
//  Feshar_App
//
//  Created by Elser_10 on 7/24/20.
//  Copyright © 2020 Elser_10. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension LoginViewController {
    
    func setupTextField() {
        
        userNameTextField.autocapitalizationType = .sentences
        
        userNameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 95/255, green: 93/255, blue: 112/255, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 95/255, green: 93/255, blue: 112/255, alpha: 1)])
        
        // change text field background color.
        userNameTextField.backgroundColor = UIColor(r: 251, g: 250, b: 255)
        passwordTextField.backgroundColor = UIColor(r: 251, g: 250, b: 255)
        
        // shift placeholder to right.
        userNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        userNameTextField.leftViewMode = .always
        
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        passwordTextField.leftViewMode = .always
    }
    
    func setupShadowLoginButton() {
        loginButton.layer.shadowColor = UIColor.red.cgColor
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowRadius = 12
        loginButton.layer.masksToBounds = false
    }
    
    func handleOrientation() {
        NotificationCenter.default.addObserver(self, selector: #selector(checkOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func checkOrientation() {
        if UIDevice.current.orientation.isLandscape {
            // when showing keyboard on landscape.
            NotificationCenter.default.addObserver(self, selector: #selector(landscapeSetupKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        }
    }
    
    @objc func landscapeSetupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardShowing), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardHiding), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func KeyboardShowing() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: -108, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    @objc func KeyboardHiding() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    func handleKeyboardDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.endEditing(true)
        }, completion: nil)
    }
    
    func check() {
        load()
        checkValidation()
    }
    
    func checkValidation() {
        if userNameTextField!.text!.isEmpty || passwordTextField!.text!.count < 6 {
            wrongLogin(with: "Warning!", and: "Please enter a valid username or password!")
        } else {
            RequestToken.shared.getRequestToken(completion: handleRequestToken(success:err:))
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            self.getLoader()
        }
    }
    
    func getLoader() {
        self.setupLoadingView()
        self.redBackgroundView.alpha = 1
        self.activityIndicator!.startAnimating()
        self.disableLoginViews()
    }
    
    func setupLoadingView() {
        setupRedBackgroundView()
        setupLoader()
    }
    
    func setupRedBackgroundView() {
        view.addSubview(redBackgroundView)
        redBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        redBackgroundView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        redBackgroundView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupLoader() {
        let frame = CGRect(x: redBackgroundView.center.x + 40, y: redBackgroundView.center.y + 40, width: 44, height: 44)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .ballSpinFadeLoader, color: .white, padding: nil)
        redBackgroundView.addSubview(activityIndicator!)
    }
    
    func disableLoginViews() {
        loginButton.isUserInteractionEnabled = false
        userNameTextField.isUserInteractionEnabled = false
        passwordTextField.isUserInteractionEnabled = false
    }
    
    func wrongLogin(with title: String, and message: String) {
        DispatchQueue.main.async {
            self.redBackgroundView.alpha = 0
            self.redBackgroundView.removeFromSuperview()
            self.showAlert(title: title, message: message)
            self.enableLoginViews()
        }
    }
    
    func enableLoginViews() {
        loginButton.isUserInteractionEnabled = true
        userNameTextField.isUserInteractionEnabled = true
        passwordTextField.isUserInteractionEnabled = true
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
