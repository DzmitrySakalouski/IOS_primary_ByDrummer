//
//  SignUpViewController.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailSignUpTextField: UITextField!
    @IBOutlet weak var passwordSignUpTextField: UITextField!
    @IBOutlet weak var confirmPasswordSignUpTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    var uuid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpElements()
        
        emailSignUpTextField.delegate = self
        passwordSignUpTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        confirmPasswordSignUpTextField.delegate = self
    }
    
    @IBAction func onChangeEmail(_ sender: UITextField) {
        self.email = sender.text!
    }
    
   
    @IBAction func onChangeFirstName(_ sender: UITextField) {
        self.firstName = sender.text!
    }
    
    
    @IBAction func onChangeLastName(_ sender: UITextField) {
        self.lastName = sender.text!
    }
    
    
    @IBAction func onChangePassword(_ sender: UITextField) {
        self.password = sender.text!
    }
    
   
    @IBAction func onChangeConfirmPassword(_ sender: UITextField) {
        self.confirmPassword = sender.text!
    }
    
    @IBAction func handleSignUpPress(_ sender: Any) {
        let error = self.validateTrextFields()
        
        if error != nil {
            showError(error!)
            return
        }
        
        print("SIGN UP \(self.password)")
      
        AuthManager.signUp(email: self.email, password: self.password, showError: showError, successHandler: saveUserData)
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func complete() {
        navigateToHome()
    }
    
    func saveUserData(_ uuid: String) {
        let userData = [
            "firstName": self.firstName,
            "lastName": self.firstName,
            "email": self.firstName,
        ]
        
        self.uuid = uuid
        
        let newUser = User(uuid: uuid, userData: userData as Dictionary<String, AnyObject>)
        UserManager.saveNewUserData(user: newUser, completeHandler: complete, showError: showError)
    }
    
    func navigateToHome() {
        let mainController = MainViewController()
        mainController.uuid = self.uuid
        
        view.window?.rootViewController = mainController
        view.window?.makeKeyAndVisible()
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
}


