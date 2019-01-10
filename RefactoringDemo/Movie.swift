//
//  Movie.swift
//  RefactoringDemo
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import Foundation

class Movie {
    enum MovieType {
        case children
        case regular
        case newRelease
    }
    
    private let title: String
    private var price: Price!
    
    init(title: String, movieType: MovieType) {
        self.title = title
        setMovieType(movieType: movieType)
    }
    
    func getTitle() -> String {
        return title
    }
    
    func setMovieType(movieType: MovieType) {
        switch movieType {
        case .regular:
            price = RegularPrice()
        case .children:
            price = ChildrensPrice()
        case .newRelease:
            price = NewReleasePrice()
        }
    }
    
    func getPrice() -> Price {
        return price
    }
    
    func getCharge(daysRented: UInt) -> Double {
        return price.getCharge(daysRented: daysRented)
    }
    
    func getFrequentRenterPoints(daysRented: UInt) -> UInt {
        return price.getFrequentRenterPoints(daysRented: daysRented)
    }
}
