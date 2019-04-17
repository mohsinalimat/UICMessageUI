//
//  ViewController.swift
//  UICMessageApp
//
//  Created by akademobi5 on 29.03.2019.
//  Copyright © 2019 FitBest Bilgi Teknolojileri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let messangerViewController = UICMessengerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .red
        
        messangerViewController.show(viewController: self)
        messangerViewController.messageList = MockMessageProvider().generateMessages()
        
        
        
        //        perform(#selector(fetchMessages), with: nil, afterDelay: 4.0)
    }
    
    @objc fileprivate func fetchMessages() {
        messangerViewController.messageList = MockMessageProvider().generateMessages()
    }
    
}

struct MockMessageProvider {
    
    private func dateFromString(pattern: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: pattern) ?? Date()
    }
    
    public func generateMessages() -> [Message] {
        return
            [Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: #imageLiteral(resourceName: "background-3"), isIncoming: true, date: Date()),
             Message(text: "Little short message", image: nil, isIncoming: true, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil, isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "17/04/2017")),
             Message(text: "Little short message", image: nil, isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil, isIncoming: false, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil, isIncoming: false, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "17/04/2017")),
             Message(text: "Little short message", image: nil, isIncoming: true, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "Waaw really cool 🎉", image: nil, isIncoming: true, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "😄😄😄😄", image: nil,  isIncoming: true, date: dateFromString(pattern: "17/04/2017")),
             Message(text: "Little short message",  image: nil, isIncoming: true, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "08/03/2017")),
             Message(text: "Little short message", image: nil, isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: false, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.",  image: nil, isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: false, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: false, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "Little short message", image: nil,  isIncoming: true, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: true, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.",  image: nil, isIncoming: true, date: dateFromString(pattern: "17/04/2017")),
             Message(text: "Little short message", image: nil,  isIncoming: true, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.",  image: nil, isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: false, date: dateFromString(pattern: "13/03/2017")),
             Message(text: "A very common task in iOS is to provide auto sizing cells for UITableView components. In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "20/03/2017")),
             Message(text: "Little short message", image: nil,  isIncoming: true, date: dateFromString(pattern: "20/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.",  image: nil, isIncoming: false, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "Provides auto sizing using anchor constraints. This technique is very easy and requires very little customization. Enjoy.", image: nil,  isIncoming: true, date: dateFromString(pattern: "12/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: false, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "This technique is very easy and requires very little customization. Enjoy.", image: nil, isIncoming: false, date: dateFromString(pattern: "17/04/2017")),
             Message(text: "Little short message", image: nil,  isIncoming: true, date: dateFromString(pattern: "17/03/2017")),
             Message(text: "In today's lesson we look at how to implement a custom cell that provides auto sizing using anchor constraints.", image: nil,  isIncoming: true, date: dateFromString(pattern: "17/03/2017"))
        ]
    }
}
