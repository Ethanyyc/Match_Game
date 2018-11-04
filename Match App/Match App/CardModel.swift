//
//  CardModel.swift
//  Match App
//
//  Created by Ethan on 2018-07-11.
//  Copyright © 2018 Ethan. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        var generatedCardsArray = [Card]()
        var generatedNumbersArray = [Int]()
        
        //Randomly generate pairs of cards: 8 pairs of cards, 16 cards totally
        while generatedNumbersArray.count < 8 {
            let randomNumber = arc4random_uniform(13) + 1
            //Make it so we only have unique pairs of cards
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                print(randomNumber)
                
                generatedNumbersArray.append(Int(randomNumber))
                
                let cardOne = Card()
                cardOne.imageName = "card" + String(randomNumber)
                generatedCardsArray.append(cardOne)
                
                let cardTwo = Card()
                cardTwo.imageName = "card" + String(randomNumber)
                generatedCardsArray.append(cardTwo)
            }
            
        }
        
        //Randomize the array
        for i in 0...generatedCardsArray.count-1 {
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        
        //Return the array
        return generatedCardsArray
    }
    
}
