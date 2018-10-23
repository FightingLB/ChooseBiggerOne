//
//  Scorer.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation

protocol Scorer {
    func computeScoreIncrement(pastTurnsReversed: [Turn]) -> Int
    var nextScorer: Scorer? { get set }
}

class MatchScorer: Scorer {
    var nextScorer: Scorer?
    
    func computeScoreIncrement(pastTurnsReversed: [Turn]) -> Int {
        var scoreIncrement: Int?
        for turn in pastTurnsReversed {
            if scoreIncrement == nil {
                scoreIncrement = turn.matched ? 1 : -1
                break
            }
        }
        return (scoreIncrement ?? 0) + (nextScorer?.computeScoreIncrement(pastTurnsReversed: pastTurnsReversed) ?? 0)
    }
}

class StreakScorer: Scorer {
    var nextScorer: Scorer?
    
    func computeScoreIncrement(pastTurnsReversed: [Turn]) -> Int {
        var nextTurn: Turn!
        var streakLength = 1
        var failureLength = 1
        for (index, turn) in pastTurnsReversed.enumerated() {
            let nextIndex = index + 1
            guard nextIndex <= (pastTurnsReversed.count - 1) else { break }
            nextTurn = pastTurnsReversed[nextIndex]
            guard turn.matched == nextTurn.matched else { break }
            turn.matched ? (streakLength += 1) : (failureLength += 1)
        }
        
        print("success \(streakLength), fail \(failureLength)")
        
        var extraScore: Int = 0
        if streakLength >= 2 || failureLength >= 2 {
            if streakLength > failureLength {
                extraScore = NSDecimalNumber(decimal: pow(2, streakLength)).intValue
            } else {
                extraScore = -NSDecimalNumber(decimal: pow(2, failureLength)).intValue
            }
        }
        return extraScore + (nextScorer?.computeScoreIncrement(pastTurnsReversed: pastTurnsReversed) ?? 0)
    }
}
