import UIKit
import Yui

class NavigationCoordinator: Coordinator {
    weak var completionDelegate: CoordinatorCompletionDelegate?
    
    weak var presentedController: UIViewController? { return navigationController }
    weak var navigationController: UINavigationController?
    weak var tabBarController: UITabBarController!
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start(animated: Bool) {
        let navigationController = UINavigationController()
        
        var controllers = tabBarController.viewControllers ?? []
        controllers.append(navigationController)
        tabBarController.setViewControllers(controllers, animated: false)

        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.start(animated: false)
        addChild(coordinator)
        
        self.navigationController = navigationController
    }
    
    var childCoordinators: [Coordinator] = []
}

