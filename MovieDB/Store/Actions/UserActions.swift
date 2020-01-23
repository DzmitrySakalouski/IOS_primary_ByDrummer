//
//  UserActions.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/23/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import ReSwift

struct GetUserActionSuccess: Action {
    var userData: User
}

struct GetUserActionError: Action {
    var error: String
}

