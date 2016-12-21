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
    
    //var color: UIColor()
    
    internal var value: Int
    internal var suit: String
    
    init(value: Int, suit: String, frame: CGRect) {
        self.value = value
        self.suit = suit
        super.init(frame: frame)
        
        //self.backgroundColor = self.randomColorGenerator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
