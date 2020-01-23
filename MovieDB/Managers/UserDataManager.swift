//
//  UserDataManager.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserManager {
    static let db = Firestore.firestore()
    
    static func saveNewUserData(user: User, completeHandler: @escaping () -> (), showError: @escaping (_ message: String) -> ()) {
        let firstName = user.firstName!
        let lastName = user.lastName!
        let uuid = user.uuid!
        self.db.collection("users").document(uuid).setData([
            "firstName": firstName,
            "lastName": lastName,
            "uuid": uuid
        ]){
            error in
            if let err = error {
                showError(err.localizedDescription)
                return
            } else {
                completeHandler()
            }
        }
    }
    
    static func getUserData(uuid: String, successHandler: @escaping (_ user: User) -> (), showError: @escaping (_ message: String) -> ()) {
        let userDocumentRef = self.db.collection("users").document(uuid)
        userDocumentRef.getDocument() {
            (document, error) in
            if let error = error {
                showError(error.localizedDescription)
                return
            }
            if let document = document {
                let data = document.data()
                if let data = data {
                    let user = User(uuid: uuid, userData: data as Dictionary<String, AnyObject>)
                    successHandler(user)
                }
            }
        }
    }
}
