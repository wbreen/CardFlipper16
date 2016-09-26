//
//  MatchGame.swift
//  CardFlip2
//
//  Created by William Breen on 9/26/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import Foundation
import UIKit

//THIS IS THE MODEL (the MVC, aka, Model View Controller)
class MatchGame{
    //what do you need to play the game?
        //deck
        //number of flips
        //score
        //4x4 list of cards for the deck
        //will also need to keep track of the last card (so it can be flipped back over when next card is chosen)
    
    let deck = Deck()
    var flips = 0
    var score = 0
    var message = "Welcome Lowly Human!"
    
    //sets first value of the previous card
    var previous = -1       //use a negative number b/c it isn't in the deck
    
    //not initializing matrix first because we need to make it a random arrangement
    var matrix: [Card] = []
        //need ": [Card] to make sure we know what sort of array the matrix is (array of cards)
        //making this a normal array (not 2D) so 1st 4 are first line, next 4 are second, etc...
    
    //initializer to fill array with values
    init() {    //nothing in "()" b/c we dont need anything from outside the class
        for _ in 1...16{
            matrix.append(deck.drawRandomCard())
            //creates new deck of card for each new game (good for new game button)
        }
    }
    
    func flipCardUp(_ which: Int){      //"_" indicates no name outside func, but called "which" inside the func
        if matrix[which].isShowing == false{
            //flip up
            matrix[which].isShowing = true
            flips += 1
            //if the card flips give -1, will need to change in final version
            score -= 1
            //update the message at the bottom of the screen
            message = matrix[which].text
            
            if(previous != 1){      //for first time, needs protection so we don't try to use -1 as the previous card value
                //logic for matching
                //want to flip the last card over
                matrix[previous].isShowing = false
            }
            previous = which
        }
    }
    
    //get card you're dealing with, and return it
    func getImage(_ which: Int) -> UIImage{         //calls getImage function in Card (same name to show they're connected)
        //what do we send back?
            //if front is showing, we want to send that 
            //if back is showing, send the back
        return matrix[which].getImage()
    }
}