//
//  TurnController.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation

class TurnController {
    var currentTurn: Turn?
    var pastTurns: [Turn] = [Turn]()
    
    private let turnStrategy: TurnStrategy
    private(set) var scorer: Scorer
    
    init(turnStrategy: TurnStrategy, scorer: Scorer, nextScorer: Scorer) {
        self.turnStrategy = turnStrategy
        self.scorer = scorer
        self.scorer.nextScorer = nextScorer
    }
    
    func beginNewTurn() -> (ShapeView, ShapeView) {
        let shapeViews = turnStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns: pastTurns)
        currentTurn = Turn(shapes: [shapeViews.0.shape, shapeViews.1.shape])
        return shapeViews
    }
    
    func endTurnWithTappedShape(tappedShape: Shape) -> Int {
        currentTurn?.turnCompletedWithTappedShape(tappedShape)
        pastTurns.append(currentTurn!)
        let scoreIncrement = scorer.computeScoreIncrement(pastTurnsReversed: pastTurns.reversed())
        return scoreIncrement
    }
}
