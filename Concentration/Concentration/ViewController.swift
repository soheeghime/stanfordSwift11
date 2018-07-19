//
//  ViewController.swift
//  Concentration
//
//  Created by Riela on 2018. 7. 17..
//  Copyright © 2018년 Riela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: ((cardButtons.count+1) / 2))
    
    var flipCount = 0{
        didSet{
            flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        
        if let cardNumber = cardButtons.index(of: sender){
            print("cardNumber \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        print("[updateViewFromModel] cardButtons.count \(cardButtons.count)")
        print("[updateViewFromModel] game.cards.count \(game.cards.count)")
        for index in cardButtons.indices{
            let button = cardButtons[index]
            print("[updateViewFromModel] index \(index)")
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices: [String] = ["👻","🎃","🐱","🐥","🌚","🥓","🥃","👻","🎃"]
    var emoji = Dictionary<Int, String>()//////////
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
            let ramdomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: ramdomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

