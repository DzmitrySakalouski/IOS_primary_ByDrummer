//
//  UserReducer.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/23/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import ReSwift

func userReducer(action: Action, state: UserState?) -> UserState {
    var state = state ?? UserState(user: nil)
    
    switch action {
    case let action as GetUserActionSuccess:
        state.user = action.userData
    case let action as GetUserActionError:
        state.error = action.error
    default: break
    }
    
    return state
}
