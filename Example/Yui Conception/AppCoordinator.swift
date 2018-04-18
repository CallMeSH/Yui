import UIKit
import Yui

class AppCoordinator {
    weak var completionDelegate: CoordinatorCompletionDelegate?

    weak var window: UIWindow!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var childCoordinators: [Coordinator] = []
}

extension AppCoordinator: Coordinator {
    func start(animated: Bool) {
        let coordinator = TabCoordinator(window: window)
        coordinator.start(animated: false)
        addChild(coordinator)        
    }
    
    var presentedController: UIViewController? { return nil }
}

