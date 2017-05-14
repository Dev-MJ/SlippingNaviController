# SlippingNaviController

# About

This makes it easier to implement backward gestures in UINavigationController, such as **Instagrams** and **Facebook**.

### UINavigationController

![gifImage](READMEImages/UINavigationController.gif)



### SlippingNavigationController

![gifImage](READMEImages/SlippingNaviController.gif)

# Requirements

* iOS 9.0 +
* Xcode 8.0 +

# Installation

**CocoaPods**

```ruby
$ gem install cocoapods
```

```ruby
use_frameworks!
platform :ios, '9.0'
pod 'SlippingNaviController'
```

```ruby
pod install
```



**Carthage**

```swift
//I don't know carthage hahahaha..
//next time :)
```



# Usage

If you are `not using a storyboard`, you can implement SlippingNavigationController instead of navigationController in AppDelegate or ViewController.

```swift
import SlippingNaviController
```

```swift
let navigationController = SlippingNaviController(rootViewController: yourviewController)
self.window?.rootViewController = navigationController
```



If you are `using a storyboard`, you can set the UINavigationController's Custom Class in the Identify Inspector.

![image](READMEImages/Identify Inspector.png)



# MIT License

```
MIT License

Copyright (c) 2017 Dev.MJ

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

