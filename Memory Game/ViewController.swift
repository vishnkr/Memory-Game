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
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip Count: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👺","🤡","👻","👽","👺","🤡","👻","👽"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        
    }
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9392274022, green: 0.3506524563, blue: 0.190652281, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

