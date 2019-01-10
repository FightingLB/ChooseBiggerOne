//
//  Price.swift
//  RefactoringDemo
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import Foundation

protocol Price {
    func getCharge(daysRented: UInt) -> Double
    func getFrequentRenterPoints(daysRented: UInt) -> UInt
}

extension Price {
    func getFrequentRenterPoints(daysRented: UInt) -> UInt {
        return 1
    }
}

class ChildrensPrice: Price {
    func getCharge(daysRented: UInt) -> Double {
        var result: Double = 1.5
        if daysRented > 3 {
            result += Double((daysRented - 3)) * 1.5
        }
        return result
    }
}

class NewReleasePrice: Price {
    func getCharge(daysRented: UInt) -> Double {
        return Double(daysRented * 3)
    }
    
    func getFrequentRenterPoints(daysRented: UInt) -> UInt {
        return daysRented > 1 ? 2 : 1
    }
}

class RegularPrice: Price {
    func getCharge(daysRented: UInt) -> Double {
        var result: Double = 2
        if daysRented > 2 {
            result += Double((daysRented - 2)) * 1.5
        }
        return result
    }
}
