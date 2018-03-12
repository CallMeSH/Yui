import Foundation

protocol DeinitNotifier {
    weak var deinitDelegate: DeinitDelegate? { get set }
}
