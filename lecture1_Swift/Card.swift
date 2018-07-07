//
//  Card.swift
//  lecture1_Swift
//
//  Created by Mohamed El Serafy on 7/6/18.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation
//structs are value types
struct Card{
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory

    }
    //feels tacky
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}
