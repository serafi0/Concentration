//
//  Concentration.swift
//  lecture1_Swift
//
//  Created by Mohamed El Serafy on 7/5/18.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation
//classes are referncce types
class Concentration
{
    
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index{
                //check  card matched 1:05:21
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            
            }else{                //no cards or 2 cards are faceUP
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceup = false
                    
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
        
            }
    }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            
            let card = Card()
            cards += [card,card]
            
        }
        //TODO: Shuffle the cards
        
    }
}
