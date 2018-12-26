//
//  ChooseBiggerOneTests.swift
//  ChooseBiggerOneTests
//
//  Created by CoderBob on 2018/10/22.
//  Copyright © 2018 lb. All rights reserved.
//

import Quick
import Nimble
@testable import ChooseBiggerOne

class ChooseBiggerOneSpec: QuickSpec {

  override func spec() {
    describe("ChooseBiggerOne Test") {
      
      context("SquareShapeFactory") {
        let factory = SquareShapeFactory(minProportion: 0, maxProportion: 1)
        let shapes = factory.createShapes()
        
        it("should create square shapes") {
          expect(shapes.0 is SquareShape).to(beTrue())
          expect(shapes.1 is SquareShape).to(beTrue())
        }
      }
      
      context("CircleShapeFactory") {
        let factory = CircleShapeFactory(minProportion: 0, maxProportion: 1)
        let shapes = factory.createShapes()
        
        it("should create circle shapes") {
          expect(shapes.0 is CircleShape).to(beTrue())
          expect(shapes.1 is CircleShape).to(beTrue())
        }
      }
    }
  }

}
