//
//  ViewController.swift
//  RefactoringDemo
//
//  Created by CoderBob on 2019/1/10.
//  Copyright © 2019 lb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movie = Movie(title: "Titanic", movieType: .regular)
        let rental = Rental(movie: movie, daysRented: 5)
        let customer = Customer(name: "Bob")
        customer.addRental(rental)
        let movie2 = Movie(title: "Inception", movieType: .newRelease)
        let rental2 = Rental(movie: movie2, daysRented: 3)
        customer.addRental(rental2)
//        movie2.setMovieType(movieType: .children)
        print(customer.statement())
    }


}

