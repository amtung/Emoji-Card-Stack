//
//  EmojiCard.swift
//  EmojiCardStack
//
//  Created by Annie Tung on 12/20/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import UIKit

protocol PlayingCard {
    var suit: String { get }
    var value: Int { get }
}

class EmojiCard: UIView, PlayingCard {
    
    internal var value: Int
    internal var suit: String
    
    let suitArray = ["😀","😬","😎","😃","😇","😈","😉","😊","😋","😛","😜","😝","🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐙","🐒","🐣","🦄","🐝","🐢","🐠","🐳","🐘","🐿","🚗","🚕","🚙","🚌","🚁","✈️","⛵️","📱","💻","📸","☎️","📺","🎮", "😸","😹","😺","😻","😼","😽","😾","😿","🙀"]
    
    
    init(value: Int, suit: String, frame: CGRect) {
        self.value = value
        self.suit = suit
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let topLeftLabel = UILabel()
        let bottomRightLabel = UILabel()
        let topSuitLabel = UILabel()
        let bottomSuitLabel = UILabel()
        
        addSubview(topLeftLabel)
        addSubview(bottomRightLabel)
        addSubview(topSuitLabel)
        addSubview(bottomSuitLabel)
        
        let randomCard = Int(arc4random_uniform(UInt32(10)))
        topLeftLabel.text = "\(randomCard + 1)"
        bottomRightLabel.text = topLeftLabel.text
        topLeftLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bottomRightLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let randomIndex = Int(arc4random_uniform(UInt32(suitArray.count)))
        topSuitLabel.text = "\(suitArray[randomIndex])"
        bottomSuitLabel.text = topSuitLabel.text
        
        let _ = [
            topLeftLabel,
            bottomRightLabel,
            topSuitLabel,
            bottomSuitLabel
            ].map { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let _ = [
            topLeftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            topLeftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            bottomRightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            bottomRightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            topSuitLabel.topAnchor.constraint(equalTo: topLeftLabel.bottomAnchor, constant: 8),
            topSuitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bottomSuitLabel.bottomAnchor.constraint(equalTo: bottomRightLabel.topAnchor, constant: -8),
            bottomSuitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            ].map { $0.isActive = true }
        
        // Middle view
        let middleView = UIView()
        addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            middleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            middleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            middleView.heightAnchor.constraint(equalToConstant: 200),
            middleView.widthAnchor.constraint(equalToConstant: 200)
        ].map { $0.isActive = true }
        middleView.backgroundColor = UIColor(red: 0.7686, green: 0.7686, blue: 0.7686, alpha: 1.0)
        let borderUIColor = UIColor(red: 0.7176, green: 0.7176, blue: 0.7176, alpha: 1.0)
        middleView.layer.borderColor = borderUIColor.cgColor
        middleView.layer.borderWidth = 1.5
        /*
         // to make a separate view to display each emoji...
        let emojiView = UIView()
        addSubview(emojiView)
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            emojiView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emojiView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emojiView.heightAnchor.constraint(equalToConstant: 50),
            emojiView.widthAnchor.constraint(equalToConstant: 50)
            ].map { $0.isActive = true }
        emojiView.backgroundColor = UIColor(red: 0.7686, green: 0.7686, blue: 0.7686, alpha: 1.0)
        let borderUIColor = UIColor(red: 0.7176, green: 0.7176, blue: 0.7176, alpha: 1.0)
        emojiView.layer.borderColor = borderUIColor.cgColor
        emojiView.layer.borderWidth = 1.5*/
        
        // Emoji label
        let middleLabel = UILabel()
        middleView.addSubview(middleLabel)
        let emojis = Array(repeating: "\(suitArray[randomIndex])", count: randomCard)
        
        let emojiText = emojis.joined(separator: " ")
        middleLabel.text = emojiText
        middleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        
        middleLabel.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            middleLabel.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            middleLabel.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),
            middleLabel.heightAnchor.constraint(equalToConstant: 200),
            middleLabel.widthAnchor.constraint(equalToConstant: 200)
            ].map { $0.isActive = true }
    }
}
