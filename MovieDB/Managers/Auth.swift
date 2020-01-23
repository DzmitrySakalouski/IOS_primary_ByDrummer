//
//  Auth.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static func signUp(email: String, password: String, showError: @escaping (_ message: String) -> (), successHandler: @escaping (_ uuid: String)->()) {
        Auth.auth().createUser(withEmail: email, password: password){
            (result, err) in
            if let err = err {
                showError(err.localizedDescription)
            } else {
                successHandler(result!.user.uid)
            }
        }
    }
    
    static func logIn(email: String, password: String, showError: @escaping (_ message: String) -> (), successHandler: @escaping () -> ()) {
        print("YESS")
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil {
                showError(error!.localizedDescription)
                return
            } else {
                print(result!)
               successHandler()
            }
        }
    }
}
