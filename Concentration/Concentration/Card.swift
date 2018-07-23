//
//  Card.swift
//  Concentration
//
//  Created by Riela on 2018. 7. 18..
//  Copyright © 2018년 Riela. All rights reserved.
//

import Foundation

struct Card: Hashable{
    var hashValue: Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
