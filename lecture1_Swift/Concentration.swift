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
    //Can access cards but can't set them
    private (set) var cards = Array<Card>()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices{
                
                if cards[index].isFaceup{
                if foundIndex == nil{
                    foundIndex = index
                    
                }else{
                    return nil
                }
            }
        }
                  return foundIndex
        }

    
        set {
            for index in cards.indices{
                cards[index].isFaceup = (index == newValue)
            }
            
        }
    }
    
    func chooseCard(at index: Int){
        
        assert(cards.indices.contains(index), "concerntration.chooseCard(at: \(index): index not in the cardss ")
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index{
                //check  card matched 1:05:21
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                
                }
                cards[index].isFaceup = true
            
            }else{                //no cards or 2 cards are faceUP
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
//extenstions for the shuffle() function
extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change 'Int' in the next line to 'IndexDistance' in < Swift 4.1
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
