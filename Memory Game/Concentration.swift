//
//  Concentration.swift
//  Memory Game
//
//  Created by Vishwa Shankar on 6/27/19.
//  Copyright © 2019 Vishwa Shankar. All rights reserved.
//

import Foundation


class Concentration{
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index:Int) -> Bool{
        var didScoreChange = false
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    didScoreChange = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            }
            else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
            
        }
        return didScoreChange
    }
    
    init(numberOfPairsOfCards:Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
}

