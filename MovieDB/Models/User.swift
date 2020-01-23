//
//  User.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/20/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import Foundation

struct User {
    var firstName: String!
    var lastName: String!
    var profileImage: String!
    var phone: String!
    var email: String!
    var uuid: String!
    
    init(uuid: String, userData: Dictionary<String, AnyObject>) {
        self.uuid = uuid
        
        if let firstName = userData["firstName"] as? String {
            self.firstName = firstName
        }
        
        if let lastName = userData["lastName"] as? String {
            self.lastName = lastName
        }
        
        if let profileImage = userData["profileImage"] as? String {
            self.profileImage = profileImage
        }
        
        if let phone = userData["phone"] as? String {
            self.phone = phone
        }
        
        if let email = userData["email"] as? String {
            self.email = email
        }
    }
}
