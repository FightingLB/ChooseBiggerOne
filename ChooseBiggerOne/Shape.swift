//
//  Shape.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Foundation
import UIKit

class Shape {
    var area: CGFloat { return 0 }
}

class SquareShape: Shape {
    var sideLength: CGFloat!
    override var area: CGFloat {
        return sideLength * sideLength
    }
}

class CircleShape: Shape {
    var diameter: CGFloat!
    override var area: CGFloat {
        return CGFloat.pi * diameter * diameter / 4
    }
}
