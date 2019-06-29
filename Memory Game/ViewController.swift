//
//  ViewController.swift
//  Memory Game
//
//  Created by Vishwa Shankar on 6/25/19.
//  Copyright © 2019 Vishwa Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game:Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var score = 0
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Score: \(score)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    
    var emojiChoices = ["👺","🤡","👻","👽","🗽","👨‍🌾","🦹‍♂️","🐋","🌪","🌏"]
    
    var emoji =  Dictionary<Int,String>()
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            
            if game.chooseCard(at: cardNumber){
                score+=1
            }
            updateViewFromMobile()
        }
        else{
            print("chosen card not in cardButton")
        }
        
    }
    
    func updateViewFromMobile(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
               button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9392274022, green: 0.3506524563, blue: 0.190652281, alpha: 1)
            }
        }
    }
    
    func emoji(for card:Card)->String{
        if emoji[card.identifier] == nil{
            if emojiChoices.count>0{
            let randomIndex = Int( arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

