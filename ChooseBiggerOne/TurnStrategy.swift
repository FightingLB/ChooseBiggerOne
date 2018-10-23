//
//  TurnStrategy.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation

protocol TurnStrategy {
    func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView)
}

class BasicTurnStrategy: TurnStrategy {
    private let shapeFactory: ShapeFactory
    private let shapeViewBuilder: ShapeViewBuilder
    
    init(shapeFactory: ShapeFactory, shapeViewBuilder: ShapeViewBuilder) {
        self.shapeFactory = shapeFactory
        self.shapeViewBuilder = shapeViewBuilder
    }
    
    func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView) {
        return shapeViewBuilder.buildShapeViewsForShapes(shapes: shapeFactory.createShapes())
    }
}

class RandomTurnStrategy: TurnStrategy {
    let firstStrategy: TurnStrategy
    let secondStrategy: TurnStrategy
    
    init(firstStrategy: TurnStrategy, secondStrategy: TurnStrategy) {
        self.firstStrategy = firstStrategy
        self.secondStrategy = secondStrategy
    }
    
    func makeShapeViewsForNextTurnGivenPastTurns(pastTurns: [Turn]) -> (ShapeView, ShapeView) {
        if Utils.randomBetweenLower(0, upper: 100) < 50 {
            return firstStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns:pastTurns)
        } else {
            return secondStrategy.makeShapeViewsForNextTurnGivenPastTurns(pastTurns:pastTurns)
        }
    }
}


