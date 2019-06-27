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
    
    func chooseCard(at index:Int){
        
    }
    
    init(numberOfPairsOfCards:Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
    }
    
}

