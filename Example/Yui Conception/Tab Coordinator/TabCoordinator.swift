import UIKit
import Yui

class TabCoordinator: Coordinator {
    weak var completionDelegate: CoordinatorCompletionDelegate?
    
    weak var window: UIWindow?
    weak var presentedController: UIViewController? { return tabBarController }
    weak var tabBarController: UITabBarController? = nil
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(animated: Bool) {
        let tabBarController = UITabBarController()
        window?.rootViewController = tabBarController
        
        let coordinator = NavigationCoordinator(tabBarController: tabBarController)
        coordinator.start(animated: false)
        addChild(coordinator)
        
        let coordinator2 = NavigationCoordinator(tabBarController: tabBarController)
        coordinator2.start(animated: false)
        addChild(coordinator2)
        
        self.tabBarController = tabBarController
    }
    
    var childCoordinators: [Coordinator] = []
}
