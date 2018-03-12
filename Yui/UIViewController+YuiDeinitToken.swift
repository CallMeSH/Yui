import UIKit

var YuiDeinitTokenAssociatedObjectHandle: UInt8 = 0

extension UIViewController  {
    var deinitToken: YuiDeinitToken? {
        get {
            return objc_getAssociatedObject(self, &YuiDeinitTokenAssociatedObjectHandle) as? YuiDeinitToken
        }
        set {
            objc_setAssociatedObject(self, &YuiDeinitTokenAssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
