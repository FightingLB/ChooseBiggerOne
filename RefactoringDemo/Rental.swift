//
//  Rental.swift
//  RefactoringDemo
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import Foundation

class Rental {
    private let movie: Movie
    private let daysRented: UInt
    
    init(movie: Movie, daysRented: UInt) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    func getDaysRented() -> UInt {
        return daysRented
    }
    
    func getMovie() -> Movie {
        return movie
    }
    
    func getCharge() -> Double {
        return movie.getCharge(daysRented: daysRented)
    }
    
    func getFrequentRenterPoints() -> UInt {
        return movie.getFrequentRenterPoints(daysRented: daysRented)
    }
}
