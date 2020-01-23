//
//  AuthViewController.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpElements()

        Auth.auth().addStateDidChangeListener() {
            auth, user in
            if user != nil {
                self.navigateToHome()
            }
        }
    }
    
    func navigateToHome() { // TODO: move to separate manager
        let mainViewController = MainViewController()
        
        view.window?.rootViewController = mainViewController
        view.window?.makeKeyAndVisible()
    }
}
