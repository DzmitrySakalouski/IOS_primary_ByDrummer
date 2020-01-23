//
//  LoginViewController.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var loginTextFileld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginTextFileld.delegate = self
        self.passwordTextField.delegate = self
        self.setUpElements()
    }
    
    @IBAction func handleLogInPress(_ sender: Any) {
        let error = self.validateTrextFields()
        
        if error != nil {
            showError(error!)
        }
        let login = loginTextFileld.text!
        let password = passwordTextField.text!
        
        print("LOG IN: \(login) PASSWORD:\(password)")
        AuthManager.logIn(email: login, password: password, showError: showError, successHandler: onLoginSuccess)
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func onLoginSuccess() {
        navigateToHome()
    }
    
    func navigateToHome() { // TODO: move to separate manager
        let mainViewController = MainViewController()
        
        view.window?.rootViewController = mainViewController
        view.window?.makeKeyAndVisible()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
}
