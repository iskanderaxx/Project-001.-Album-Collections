
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
        let firstItemController = FirstTabBarViewController()
        let firstIcon = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle.fill"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        firstItemController.tabBarItem = firstIcon
        
        let secondItemController = SecondTabBarViewController()
        let secondIcon = UITabBarItem(title: "For you", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        secondItemController.tabBarItem = secondIcon
        
        let thirdItemController = MyAlbumsViewController()
        let thirdIcon = UITabBarItem(title: "Albums", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        thirdItemController.tabBarItem = thirdIcon
        
        
        let forthItemController = ForthTabBarViewController()
        let forthIcon = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        forthItemController.tabBarItem = forthIcon
        
        let controllers = [firstItemController, secondItemController, thirdItemController, forthItemController]
        self.setViewControllers(controllers, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        true
    }
}
