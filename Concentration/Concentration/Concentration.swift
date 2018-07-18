//
//  Concentration.swift
//  Concentration
//
//  Created by Riela on 2018. 7. 18..
//  Copyright © 2018년 Riela. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?   // faced up card
    
    func chooseCard(at index: Int){
        print("[chooseCard] index \(index)")
        print("[chooseCard] cards.count \(cards.count)")
        if !cards[index].isMatched{
            // 1) chose different cards
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // 2) no cards faced up, 3) 2 cards faced up
                // make all cards face down
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        
        print("[init] numberOfPairsOfCards \(numberOfPairsOfCards)")
        
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        print("[init] cards \(cards.count)")
    }
}
