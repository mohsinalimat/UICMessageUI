//
//  UICMessengerViewController.swift
//  UICMessageApp
//
//  Created by Coder ACJHP on 29.03.2019.
//  Copyright © 2019 Onur Işık. All rights reserved.
//

import UIKit

class UICMessengerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var navigationTitle: String?
    private var navigationBar: UINavigationBar?
    
    private func setNavigationBar(withTitle: String) {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        navigationBar = UINavigationBar(frame: frame)
        let navigationItem = UINavigationItem(title: withTitle)
        navigationBar!.prefersLargeTitles = true
        navigationBar!.setItems([navigationItem], animated: true)
        self.view.addSubview(navigationBar!)
    }
    
    private var tableView: UITableView!
    private let messageBubleId = "messageCell"
    public var messageList = [Message]() {
        didSet {
            
            if messageList.count == 0 {
                messages.removeAll(keepingCapacity: false)
                addMessageLabel()
            } else {
                tableView.backgroundView = nil
                sortMessages(grouping: messageList)
            }
            
            tableView.reloadData()
        }
    }
    private var messages = Array<Array<Message>>()
    
    private let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setNavigationBar(withTitle: navigationTitle ?? "Messages")
        
        
        let tableViewFrame = CGRect(x: 0, y: navigationBar!.frame.height, width: view.frame.width, height: view.frame.height - navigationBar!.frame.height)
        tableView = UITableView(frame: tableViewFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        self.view.addSubview(tableView)
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: messageBubleId)
    }
    
    fileprivate func addMessageLabel() {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .lightGray
        label.text = "No messages!"
        label.textAlignment = .center
        tableView.backgroundView = label
    }
    
    fileprivate func sortMessages(grouping: Array<Message>) {
        
        let groupedMessages = Dictionary(grouping: grouping) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let value = groupedMessages[key]
            messages.append(value ?? [])
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let reusableHeaderView = HeaderView()
        if let firstMessage = messages[section].first {
            reusableHeaderView.label.text = dateFormatter.string(from: firstMessage.date)
        }
        return reusableHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageBubleId, for: indexPath) as! ChatMessageCell
        cell.chatMessage = messages[indexPath.section][indexPath.row]
        return cell
    }
    
    
    // Mark: - Simple show and hide functions goes here
    @objc public func show(viewController on: UIViewController) {
        on.addChild(self)
        self.view.frame = on.view.frame
        on.view.addSubview(self.view)
        self.didMove(toParent: on)
    }
    
    @objc public func dismiss() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
}


// Mark: - Custom message cell class

class ChatMessageCell: UITableViewCell {
    
    
    
    let stackView = UIStackView()
    let messageLabel = UILabel()
    let bubleView = UIView()
    let imgView = UIImageView()
    var chatMessage: Message! {
        didSet {
            bubleView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.image != nil {
                imgView.image = chatMessage.image
                imgWidthConstraint.isActive = true
                imgHeightConstraint.isActive = true
                stackView.spacing = 5
                stackView.layoutSubviews()
                stackView.layoutIfNeeded()
            } else {
                stackView.spacing = 0
            }
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            } else {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }
        }
    }
    
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var imgWidthConstraint: NSLayoutConstraint!
    private var imgHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        
        bubleView.backgroundColor = .green
        bubleView.layer.cornerRadius = 10
        bubleView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubleView)
        
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imgView)
        
        messageLabel.numberOfLines = 0
        stackView.addArrangedSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            bubleView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
            bubleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -16),
            bubleView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            bubleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16)
        ])
        
        leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        
        
        imgWidthConstraint = imgView.widthAnchor.constraint(equalToConstant: 250)
        imgHeightConstraint = imgView.heightAnchor.constraint(equalToConstant: 200)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// Mark: - Custom header view's label class for section's header

class HeaderViewLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(white: 0.75, alpha: 1)
        textColor = .white
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let originalSize = super.intrinsicContentSize
        return CGSize(width: originalSize.width + 14, height: originalSize.height + 12)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
}

// Mark: - Custom header view class for section's header

class HeaderView: UIView {
    
    let label = HeaderViewLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// Mark: - Message model class

struct Message {
    
    let text: String
    let image: UIImage?
    let isIncoming: Bool
    let date: Date
}
