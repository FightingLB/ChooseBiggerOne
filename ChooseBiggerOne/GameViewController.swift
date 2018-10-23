//
//  ViewController.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private var gameView: GameView {
        return view as! GameView
    }
    private var turnController: TurnController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let squareShapeViewFactory = SquareShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let squareShapeFactory = SquareShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let squareShapeViewBuilder = shapeViewBuilderForFactory(squareShapeViewFactory)
        let squareTurnStrategy = BasicTurnStrategy(shapeFactory: squareShapeFactory, shapeViewBuilder: squareShapeViewBuilder)
        
        let circleShapeViewFactory = CircleShapeViewFactory(size: gameView.sizeAvailableForShapes())
        let circleShapeFactory = CircleShapeFactory(minProportion: 0.3, maxProportion: 0.8)
        let circleShapeViewBuilder = shapeViewBuilderForFactory(circleShapeViewFactory)
        let circleTurnStrategy = BasicTurnStrategy(shapeFactory: circleShapeFactory, shapeViewBuilder: circleShapeViewBuilder)
        
        let randomTurnStrategy = RandomTurnStrategy(firstStrategy: squareTurnStrategy, secondStrategy: circleTurnStrategy)
        
        turnController = TurnController(turnStrategy: randomTurnStrategy, scorer: MatchScorer(), nextScorer: StreakScorer())
        
        beginNextTurn()
    }
    
    private func shapeViewBuilderForFactory(_ shapeViewFactory: ShapeViewFactory) -> ShapeViewBuilder {
        let shapeViewBuilder = ShapeViewBuilder(shapeViewFactory: shapeViewFactory)
        shapeViewBuilder.fillColor = UIColor.brown
        shapeViewBuilder.outlineColor = UIColor.orange
        return shapeViewBuilder
    }
    
    private func beginNextTurn() {
        let shapeViews = turnController.beginNewTurn()
        
        shapeViews.0.tapHandler = {
            tappedView in
            self.gameView.score += self.turnController.endTurnWithTappedShape(tappedShape: tappedView.shape)
            self.beginNextTurn()
        }
        shapeViews.1.tapHandler = shapeViews.0.tapHandler
        
        gameView.addShapeViews(newShapeViews: shapeViews)
    }

}

