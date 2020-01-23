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
        let firstName = user.firstName
        let lastName = user.lastName
        let uuid = user.uuid!
        self.db.collection("users").addDocument(data: [
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
}
