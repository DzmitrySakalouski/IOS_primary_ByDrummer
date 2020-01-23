//
//  ProfileViewController.swift
//  MovieDB
//
//  Created by Dzmitry  Sakalouski  on 1/21/20.
//  Copyright © 2020 Dzmitry  Sakalouski . All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureUI()
    }
    
//  TODO override var preferredStatusBarStyle: UIStatusBarStyle { } change style of status bar (light...)
    
    func configureUI() {
        view.backgroundColor = .white
        let userHeader = UserInfoProfileHeadeView()
        userHeader.leftButtonHandler = handleDismuss
        
        view.addSubview(userHeader)
        
        userHeader.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
        
    }
    
    func configureNavigationBar() {
        self.edgesForExtendedLayout = .bottom
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = true
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
//        view.backgroundColor = .white
//        navigationController?.navigationBar.backgroundColor = .clear
//        navigationItem.title = "Profile"
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "baseline_clear_white_36pt_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismuss))
    }
    
    // MARK: - Handlers
    func handleDismuss() {
        dismiss(animated: true, completion: nil)
    }

}
