import UIKit

public protocol Coordinator: DeinitDelegate, CoordinatorCompletionDelegate {
    var completionDelegate: CoordinatorCompletionDelegate? { get set }
    
    var presentedController: UIViewController? { get }
    
    func start(animated: Bool)

    var childCoordinators: [Coordinator] { get set }
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
}

public extension Coordinator {
    func addChild(_ coordinator: Coordinator) {
        coordinator.completionDelegate = self
        
        let deinitToken = YuiDeinitToken()
        deinitToken.deinitDelegate = coordinator
        coordinator.presentedController!.deinitToken = deinitToken
        
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard let index = childCoordinators.index(where: { $0 === coordinator }) else {
            debugPrint("Tried to remove coordinator \(coordinator) but could not find it in the children of \(self), could that be a bug? 🤔")
            return
        }
        childCoordinators.remove(at: index)
    }
    
    func willDeinit(deInitedObject: Any) {
        completionDelegate?.didFinish(sender: self)
    }
    
    func didFinish(sender: Coordinator) {
        removeChild(sender)
    }
}
