import Foundation

public protocol DeinitDelegate: class {
    func willDeinit(deInitedObject: Any)
}
