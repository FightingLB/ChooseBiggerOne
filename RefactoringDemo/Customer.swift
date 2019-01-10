//
//  Customer.swift
//  RefactoringDemo
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import Foundation

class Customer {
    private let name: String
    private var rentals: [Rental] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(_ aRental: Rental) {
        rentals.append(aRental)
    }
    
    func getName() -> String {
        return name
    }
    
    func statement() -> String {
        var result: String = "Rental record for " + getName() + "\n"
        result = rentals.reduce(result) {
            $0 + "\t" + $1.getMovie().getTitle() + " " + $1.getCharge().description + "\n"
        }
        result += "Amount owed is " + getTotalAmount().description + "\n"
        result += "You earned " + getTotalFrequentRenterPoints().description + " frequent renter points"
        return result
    }
    
    func getTotalAmount() -> Double {
        var result: Double = 0
        result = rentals.reduce(result) { $0 + $1.getCharge() }
        return result
    }
    
    func getTotalFrequentRenterPoints() -> UInt {
        var result: UInt = 0
        result = rentals.reduce(result) { $0 + $1.getFrequentRenterPoints() }
        return result
    }
}
