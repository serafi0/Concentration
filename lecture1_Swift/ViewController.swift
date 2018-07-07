//
//  ViewController.swift
//  lecture1_Swift
//
//  Created by Mohamed El Serafy on 7/5/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //lazy can't use didSet {}
    
     @IBOutlet private weak var flipCountLabel: UILabel!
    
    
     @IBOutlet private var CardButtons: [UIButton]!
    
    
    
     @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let CardNumber = CardButtons.index(of: sender){

            game.chooseCard(at: CardNumber)
            updateViewFromModel()
            
        
    }
        else{
            print("chosen Card was not in CardButton")
        }
        
    
    }
    /* func NewGameButton(_ sender: UIButton) {
        flipCount=0
flipCountLabel.text = "Flips: \(flipCount)"
        for i in CardButtons.indices{
            let button = CardButtons[i]
            var card = game.cards[i]
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            card.isFaceup =  false
            card.isMatched = false
            emoji[card.identifier] = nil
            
     }}*/
        
        
    
    
    func updateViewFromModel(){
        for index in CardButtons.indices{
        let button = CardButtons[index]
        let card = game.cards[index]
        if card.isFaceup{
            button.setTitle(emoji(for: card),for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        }   }
    
    
    //not settable
    var numberOfPairsOfCards:Int {
        return (CardButtons.count + 1 ) / 2
    }
    
   private  lazy var game = Concentration(numberOfPairsOfCards:(numberOfPairsOfCards))
    
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
            
            
            
            
            
        }
    }

    
    private var emojiChoices:Array<String> = ["😱","🦉","👻","🎃","😈","🍭","🎱","🙀","🦇","🤖","☠️","🐞"]

    
   private  var emoji = Dictionary<Int,String>()
    
   private func emoji(for card:Card) ->String
    {
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
        
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
      return emoji[card.identifier] ?? "?"
        
    }
}


extension Int {
    
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
            
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }

    
    
}







    
    
    
 /*   func flipCard(withEmoji emoji: String, on button:UIButton){
      if button.currentTitle==emoji{
           button.setTitle("", for: UIControlState.normal)
          button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
      }else{
          button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
     }}
 */
   
    
    




