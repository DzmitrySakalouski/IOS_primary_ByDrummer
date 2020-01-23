//
//  ProfileViewController.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/21/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit
import ReSwift

class ProfileViewController: UIViewController {
    // MARK: - Properties
    var userHeader: UserInfoProfileHeadeView!

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self){
            return $0.select { return $0.userState! }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      // 3
      store.unsubscribe(self)
    }
    
//  TODO override var preferredStatusBarStyle: UIStatusBarStyle { } change style of status bar (light...)
    
    // MARK: - Configure
    
    func configureUI() {
        view.backgroundColor = .white
        userHeader = UserInfoProfileHeadeView()
        userHeader.leftButtonHandler = handleDismuss
        
        view.addSubview(userHeader)
        
        userHeader.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
        
    }
    
    func configureNavigationBar() {
        self.edgesForExtendedLayout = .bottom
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = true
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Handlers
    
    func handleDismuss() {
        dismiss(animated: true, completion: nil)
    }

}

extension ProfileViewController: StoreSubscriber {
    
    func newState(state: UserState) {

        if let user = state.user {
            userHeader.fillUserData(user: user)
        }

    }
}
