//
//  CoffeeAppTests.swift
//  CoffeeAppTests
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import XCTest
@testable import CoffeeApp

class CoffeeAPITests: XCTestCase {

    func testFetchHotCoffee() {
        // Expectation to wait for the async call to complete
        let expectation = self.expectation(description: "Fetching hot coffee data")
        
        // Call the function
        let coffee = CoffeeAPIClient()
        coffee.fetchCoffee { coffeeList in
            // Test if coffeeList is not nil
            XCTAssertNotNil(coffeeList, "The coffeeList should not be nil")
            
            // Test if coffeeList has elements
//            XCTAssertGreaterThan(coffeeList.count ?? 0, 0, "The coffeeList should contain at least one item")
            
            // Test if the first item contains the expected properties
//            if let coffee = coffeeList.first {
//                XCTAssertNotNil(coffee.title, "Coffee item should have a title")
//                XCTAssertNotNil(coffee.description, "Coffee item should have a description")
//                XCTAssertNotNil(coffee.ingredients, "Coffee item should have ingredients")
//                XCTAssertNotNil(coffee.id, "Coffee item should have an id")
//            }
            
            // Fulfill the expectation to indicate that the background task has finished successfully
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled, with a timeout of 5 seconds
        waitForExpectations(timeout: 5, handler: nil)
    }
}
