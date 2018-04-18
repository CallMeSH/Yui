import UIKit
import Yui

class DetailCoordinator {
    weak var completionDelegate: CoordinatorCompletionDelegate?

    weak var window: UIWindow?
    
    weak var navigationController: UINavigationController!
    weak var viewController: DetailController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var childCoordinators: [Coordinator] = []
    
    deinit {
        print("Deinit called for \(self)")
    }
}

extension DetailCoordinator: Coordinator {
    func start(animated: Bool) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! DetailController
        vc.delegate = self
        viewController = vc
        
        navigationController.pushViewController(vc, animated: animated)
    }
    
    var presentedController: UIViewController? { return viewController }
}

extension DetailCoordinator: DetailControllerDelegate {
    func didTouchPushButton() {
        let coordinator = DetailCoordinator(navigationController: navigationController)
        coordinator.start(animated: true)
        addChild(coordinator)
    }
}
