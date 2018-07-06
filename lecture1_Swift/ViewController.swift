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
    lazy var game = Concentration(numberOfPairsOfCards:(CardButtons.count + 1) / 2 )
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
            
            
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var CardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let CardNumber = CardButtons.index(of: sender){

            game.chooseCard(at: CardNumber)
            updateViewFromModel()
            
        
    }
        else{
            print("chosen Card was not in CardButton")
        }
        
    
    }
    
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
    
    var emojiChoices:Array<String> = ["😱","🦉","👻","🎃","😈","🍭","🎱","🙀","🦇"]

    
    var emoji = Dictionary<Int,String>()
    
    func emoji(for card:Card) ->String
    {
        if emoji[card.identifier] == nil , emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
      return emoji[card.identifier] ?? "?"
        
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
   
    
    




