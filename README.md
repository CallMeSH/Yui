# Yui: Use Coordinators, avoid reference cycles.

Coordinator pattern is a great way to add reusability to View Controllers by extracting the navigation logic into a separate object. To learn more about this concept, you should read this article on KHANLOU’s amazing blog.

But Coordinator, if not implemented well, can lead to massive memory leaks due to zombie Coordinators and View Controllers.

## Protocol oriented Coordinator
Yui’s main protocol: `Coordinator`. Assumes that you will want every Coordinator to embed multiple sub-Coordinators in a tree. This is why you have to provide it with an array of `Coordinator`. 

Yui defines several extensions as default implementation of its protocol, making it easy to manipulate child coordinators. If used as intended, Yui will prevent the coordinators from leaking.

On a View Controller deallocation, its `Coordinator` will self-destruct by telling its parent Coordinator (if any) to remove itself from the `Coordinator` tree.

This flexible architecture lets you implement any kind of navigation in your app (`UINavigationController`, `UITabBarController`, Embeded View Controller…).

## Installation
### CocoaPods

To integrate Yui into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Yui', '~> 0.1.0'
```

Then, run the following command:

```bash
pod install
```

### Carthage

To integrate Yui into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "CallMeSH/Yui" ~> 0.1.0
```

Run `carthage update` to build the framework and drag the built `Yui.framework` into your Xcode project.

## Implementing Coordinators with Yui

Using Yui is as simple as conforming to the `Coordinator` protocol.

The protocol requires you  to create this method:

### `start(animated:Bool)`

A method that is called when the controller needs to be displayed. For memory safety reasons, you will usually want to create the controller in this method and only keep a weak reference to it once it’s handed to UIKit (pushed on a navigation controller or added as a child view controller for instance).

And these properties: 

### `completionDelegate`

A weak variable that is needed to tell your parent coordinator that you want it to self-destuct. The `Coordinator` default implementation takes care of setting up the delegation.

### `childCoordinators`

An array of coordinators to keep in memory.

### `viewController`

A property that returns the view controller managed by the coordinator if it exists. 

Yui tries to have a minimal footprint on your project, in order to do so, it comes out of the box with only one protocol. If you think the setup of each step is too tedious, we recommend you create a root class that will implement both the deallocation delegate and the child coordinators array.

## Usage example
A demonstration project is included in the demo `Example` directory of the project.
It implements both a tab bar and a navigation controller-based app architecture. This should inspire you for your next project.

## Contributing
Yui’s source code is fairly simple and uses the Objective-C Runtime for now as Swift does not have a concept of lifetime(link to rust doc).
We are always looking for better ways to do things. If you think you could bring some improvements to make the library better, we would be happy to review your Pull Request or Request For Change!

## Work In Progress
- [ ] Add unit tests
- [ ] Add integration tests
- [ ] Add an auto-generated documentation of the public types
