//
//  RefactoringDemoTests.swift
//  RefactoringDemoTests
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import Quick
import Nimble
@testable import RefactoringDemo

class RefactoringDemoSpec: QuickSpec {

    override func spec() {
        describe("RefactoringDemo Test") {
            
            context("Customer’s statement") {
                let customer = Customer(name: "Bob")
                let movie = Movie(title: "Titanic", movieType: .regular)
                let rental = Rental(movie: movie, daysRented: 5)
                customer.addRental(rental)
                it("should not be nil") {
                    expect(customer.statement().count > 0).to(beTrue())
                }
            }
            
            context("Rent a regular movie for 5 days") {
                let customer = Customer(name: "Bob")
                let movie = Movie(title: "Titanic", movieType: .regular)
                let rental = Rental(movie: movie, daysRented: 5)
                customer.addRental(rental)
                it("should spend 6.5$") {
                    expect(customer.getTotalAmount() == 6.5).to(beTrue())
                }
                it("should earned 1 frequent renter points") {
                    expect(customer.getTotalFrequentRenterPoints() == 1).to(beTrue())
                }
            }
            
            context("Rent a newRelease movie for 3 days") {
                let customer = Customer(name: "Bob")
                let movie = Movie(title: "Inception", movieType: .newRelease)
                let rental = Rental(movie: movie, daysRented: 3)
                customer.addRental(rental)
                it("should spend 9$") {
                    expect(customer.getTotalAmount() == 9).to(beTrue())
                }
                it("should earned 2 frequent renter points") {
                    expect(customer.getTotalFrequentRenterPoints() == 2).to(beTrue())
                }
            }
            
            context("Rent a children movie for 2 days") {
                let customer = Customer(name: "Bob")
                let movie = Movie(title: "How To Train Your Dragon", movieType: .children)
                let rental = Rental(movie: movie, daysRented: 2)
                customer.addRental(rental)
                it("should spend 1.5$") {
                    expect(customer.getTotalAmount() == 1.5).to(beTrue())
                }
                it("should earned 1 frequent renter points") {
                    expect(customer.getTotalFrequentRenterPoints() == 1).to(beTrue())
                }
            }
            
            context("Rent a children movie for 2 days and a newRelease movie for 3 days") {
                let customer = Customer(name: "Bob")
                let movie = Movie(title: "How To Train Your Dragon", movieType: .children)
                let rental = Rental(movie: movie, daysRented: 2)
                let movie2 = Movie(title: "Inception", movieType: .newRelease)
                let rental2 = Rental(movie: movie2, daysRented: 3)
                customer.addRental(rental)
                customer.addRental(rental2)
                it("should spend 10.5$") {
                    expect(customer.getTotalAmount() == 10.5).to(beTrue())
                }
                it("should earned 3 frequent renter points") {
                    expect(customer.getTotalFrequentRenterPoints() == 3).to(beTrue())
                }
            }
            
            context("create a children movie") {
                let movie = Movie(title: "How To Train Your Dragon", movieType: .children)
                it("should have a ChildrenPrice type price") {
                    expect(movie.getPrice() is ChildrensPrice).to(beTrue())
                }
            }
        }
    }

}
