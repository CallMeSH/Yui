import Foundation

protocol DeinitNotifier {
    var deinitDelegate: DeinitDelegate? { get set }
}
