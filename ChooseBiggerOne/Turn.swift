//
//  Turn.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation

class Turn {
    let shapes: [Shape]
    var matched: Bool!
    
    init(shapes: [Shape]) {
        self.shapes = shapes
    }
    
    func turnCompletedWithTappedShape(_ tappedShape: Shape) {
        let maxArea = shapes.reduce(0) { $0 > $1.area ? $0 : $1.area }
        matched = tappedShape.area >= maxArea
    }
}
