//
//  ShapeViewBuilder.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation
import UIKit

class ShapeViewBuilder {
    var showFill = true
    var fillColor = UIColor.orange
    
    var showOutline = true
    var outlineColor = UIColor.orange
    
    private var shapeViewFactory: ShapeViewFactory
    
    init(shapeViewFactory: ShapeViewFactory) {
        self.shapeViewFactory = shapeViewFactory
    }
    
    func buildShapeViewsForShapes(shapes: (Shape, Shape)) -> (ShapeView, ShapeView) {
        let shapeViews = shapeViewFactory.makeShapeViewsforShapes(shapes: shapes)
        configureShapeView(shapeView: shapeViews.0)
        configureShapeView(shapeView: shapeViews.1)
        return shapeViews
    }
    
    private func configureShapeView(shapeView: ShapeView) {
        shapeView.showFill = showFill
        shapeView.fillColor = fillColor
        shapeView.showOutline = showOutline
        shapeView.outlineColor = outlineColor
    }
}
