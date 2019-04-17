# UICMessageUI
Custom chat inner page (bubbles page) user interface like whatsapp with new look for swift 
No storyboard just edit from the code (if you want)

### Screenshot: 
<img src="https://github.com/Coder-ACJHP/UICMessageUI/blob/master/UICMessageApp/Assets.xcassets/messenger.dataset/messenger.gif">

## How to implement it? (use it)

```
import UIKit

class YourCustomViewController: UIViewController {
    
    let messangerViewController = UICMessengerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messangerViewController.show(viewController: self)
        messangerViewController.messageList = MockMessageProvider().generateMessages()
    }
}

```

## Next steps
1- Add write message functionality
2- Add chats view controller

## Requirements
Xcode 9 or later <br>
iOS 10.0 or later <br>
Swift 4 or later <br>

#### Licence : 
The MIT License (MIT)
