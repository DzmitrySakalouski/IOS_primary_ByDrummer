
import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    // MARK: - Properties
    var delegate: NavViewControllerDelegate?
    var logOutButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.text = "LogOut"
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavigationBar()
    }
    
    //MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @objc func logout() {
    do {
            try Auth.auth().signOut()
        } catch {
            print("error")
        }
        
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "All ADs"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logout))
    }
    
    // MARK: - API call

}
