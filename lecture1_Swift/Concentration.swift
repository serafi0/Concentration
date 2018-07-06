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
        cards = cards.shuffled()
    }
}
//extenstions for the shuffle()
extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
