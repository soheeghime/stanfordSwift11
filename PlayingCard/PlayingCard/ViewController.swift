//
//  ViewController.swift
//  PlayingCard
//
//  Created by Riela on 2018. 7. 23..
//  Copyright © 2018년 Riela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10{
            if let card = deck.draw(){
                print("\(card)")
            }
            
            
//            for suit in PlayingCard.Suit.all{
//                for rank in PlayingCard.Rank.all{
//                    cards.append(PlayingCard(suit: suit, rank: rank))
//                }
//            }
        }
    }
}

