
import UIKit
import SnapKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
         super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup & Layout
    
    private func setupTabBarController() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.selectedImageTintColor = .systemBlue
    }
    
    private func setupTabBarViewControllers() {
        let firstItem = FirstTabBarViewController()
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        firstItem.tabBarItem = firstIcon
        
        let secondItem = SecondTabBarViewController()
        let secondIcon = UITabBarItem(title: "For you", image: UIImage(named: "icons8-for-you"), selectedImage: UIImage(named: "icons8-for-you"))
        secondItem.tabBarItem = secondIcon
        
        
        let thirdItem = AlbumMainViewController()
        let thirdIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        thirdItem.tabBarItem = thirdIcon
        
        
        let forthItem = ForthTabBarViewController()
        let forthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        forthItem.tabBarItem = forthIcon
        
        let controllers = [firstItem, secondItem, thirdItem, forthItem]
        self.setViewControllers(controllers, animated: true)
    }
}
