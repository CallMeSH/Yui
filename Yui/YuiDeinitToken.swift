import Foundation

class YuiDeinitToken: DeinitNotifier {
    var deinitDelegate: DeinitDelegate?
    
    deinit {
        guard let delegate = deinitDelegate else {
                return
        }
        delegate.willDeinit(deInitedObject: self)
    }
}
