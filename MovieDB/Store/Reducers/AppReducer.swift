//
//  AppReducer.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/23/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(userState: userReducer(action: action, state: state?.userState))
}
