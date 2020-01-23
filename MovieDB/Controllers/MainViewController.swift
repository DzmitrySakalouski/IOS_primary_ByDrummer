import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    var menuViewController: MenuViewController!
    var centerController: UIViewController!
    var isExpanded: Bool = false
    var tapRecognizer: UITapGestureRecognizer!
    var swipeRecognizer: UISwipeGestureRecognizer!
    
    var uuid: String!
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeController()
        configureMenuController()
        
        fetchData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Handlers
    
    func configureSwipe() {
        swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleMenuClose(sender:)))
        swipeRecognizer.direction = .left
        self.view.addGestureRecognizer(swipeRecognizer)
    }
    
    func removeSwipe() {
        self.view.removeGestureRecognizer(swipeRecognizer)
    }
    
    @objc func handleMenuClose(sender: UIGestureRecognizer) {
        handleMenuToggle(forMenuOption: nil)
    }
    
    func configureHomeController() {
        let homeViewController = HomeViewController()
        centerController = UINavigationController(rootViewController: homeViewController)
        homeViewController.delegate = self
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
        }
    }
    
    func animatePannel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }){
                (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }

    }

    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            let controller = ProfileViewController()
            navigateTo(targetController: controller)
        case .Inbox:
            print("Settings")
        case .Notifications:
            print("Notifications")
        case .Settings:
            let controller = SettingsViewController()
            navigateTo(targetController: controller)
        }
    }
    
    func navigateTo(targetController: UIViewController) {
        let navController = UINavigationController(rootViewController: targetController)
        navController.modalPresentationStyle = .fullScreen
        navController.definesPresentationContext = true
        navController.extendedLayoutIncludesOpaqueBars = true
        present(navController, animated: true, completion: nil)
    }
    
    func fetchData() {
        if let uuid = uuid {
            UserManager.getUserData(uuid: uuid, successHandler: getUserDataSuccessHandler, showError: showError)
        }
    }
    
    func getUserDataSuccessHandler(user: User) {
        print("userData")
        store.dispatch(GetUserActionSuccess(userData: user))
    }
    
    func showError(message: String) {
        print("message")
        print(message)
    }
}

extension MainViewController: NavViewControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
            configureSwipe()
        } else {
            removeSwipe()
        }
        
        isExpanded = !isExpanded
        animatePannel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
   
}
