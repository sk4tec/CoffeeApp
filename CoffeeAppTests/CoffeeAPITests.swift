//
//  CoffeeAppTests.swift
//  CoffeeAppTests
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import XCTest
@testable import CoffeeApp

class CoffeeAPITests: XCTestCase {
    func test_givenUserWantsHotCoffeeAndApiIsWorking_fetchHotCoffee() {
        let coffee = CoffeeAPIClient()
        coffee.fetchCoffee { coffeeList in
            if case .success(let coffee) = coffeeList {
                XCTAssertEqual(coffee.count, 20)
            }
        }
    }

    func test_givenUserSubmitsAndApiDoesNotExist_throwError() async {
        let client = CoffeeAPIClient()
        do {
            try client.submitReview()
            XCTFail("Expected submitReview to throw an error, but it did not.")
        } catch {
            XCTAssertEqual(error as! Error, Error.networkError)
        }
    }
}
