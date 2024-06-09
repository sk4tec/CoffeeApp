//
//  CoffeeViewModelTests.swift
//  CoffeeAppTests
//
//  Created by Sunjay Kalsi on 09/06/2024.
//

import XCTest
@testable import CoffeeApp

class CoffeeViewModelTests: XCTestCase {
    func test_givenApiLoads_shouldShowData() {
        let sut = HomeView(viewModel: .init())
        let expectation = self.expectation(description: "set the VM to show data")

        sut.viewModel.fetchCoffee()

        if case .success(_) = sut.viewModel.state {
            expectation.fulfill()
        }

        // not sure how to get this test working :o/
        waitForExpectations(timeout: 1)
    }
}
