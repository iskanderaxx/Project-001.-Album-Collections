
import UIKit
import SnapKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupNavigationTitle()
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup & Layout
    
    private func setupTabBarController() {
        tabBar.tintColor = .lightGray
        tabBar.backgroundColor = .systemGray2
        tabBar.selectedImageTintColor = .systemBlue
    }
    
    private func setupNavigationTitle() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setLeftBarButton(UIBarButtonItem(title: nil,
                                                        image: UIImage(systemName: "plus"),
                                                        primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
                                                        menu: nil),
                                        animated: true)
    }

    private func setupTabBarViewControllers() {
        
        let firstItemController = LibraryViewController()
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        firstItemController.tabBarItem = firstIcon
        
        let secondItemController = ForYouViewController()
        let secondIcon = UITabBarItem(title: "For you", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        secondItemController.tabBarItem = secondIcon
        
        let thirdItemController = MainViewController()
        let thirdIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        thirdItemController.tabBarItem = thirdIcon
        
        
        let forthItemController = SearchViewController()
        let forthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        forthItemController.tabBarItem = forthIcon
        
        let controllers = [firstItemController, secondItemController, thirdItemController, forthItemController]
        self.setViewControllers(controllers, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
