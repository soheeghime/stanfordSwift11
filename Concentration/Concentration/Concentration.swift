//
//  Concentration.swift
//  Concentration
//
//  Created by Riela on 2018. 7. 18..
//  Copyright © 2018년 Riela. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            // 1) chose different cards
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // 2) no cards faced up, 3) 2 cards faced up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
        /* if !cards[index].isMatched{
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
         }*/
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards!
        
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
}

extension Collection{
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
