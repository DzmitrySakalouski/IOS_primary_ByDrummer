//
//  AppState.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/23/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var userState: UserState?
}

struct UserState: StateType {
    var user: User?
    var error: String?
}
