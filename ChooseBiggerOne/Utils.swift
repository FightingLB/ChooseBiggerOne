//
//  Utils.swift
//  ChooseBiggerOne
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import UIKit

class Utils {
    class func randomBetweenLower(_ lower: CGFloat, upper: CGFloat) -> CGFloat {
        return lower + CGFloat(arc4random_uniform(101)) / 100.0 * (upper - lower)
    }
}
