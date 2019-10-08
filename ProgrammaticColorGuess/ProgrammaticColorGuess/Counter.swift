//
//  Counter.swift
//  ProgrammaticColorGuess
//
//  Created by Sam Roman on 10/8/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

struct Counter {
    var score = 0
    var highScore = 0
    
    mutating func increment() {
        score += 1
//        return score
    }
    
    mutating func reset()  {
        score = 0
//        return score
    
    }
    mutating func highScoreSetter() {
        if score > highScore {
            highScore = score
//            return highScore
        }
        }
}
