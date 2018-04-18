import UIKit

class DetailController: UIViewController {
    weak var delegate: DetailControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail: \(navigationController?.viewControllers.count ?? 0)"
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        delegate?.didTouchPushButton()
    }
    
    deinit {
        print("Deinit called for \(self)")
    }
}

protocol DetailControllerDelegate: class {
    func didTouchPushButton()
}
