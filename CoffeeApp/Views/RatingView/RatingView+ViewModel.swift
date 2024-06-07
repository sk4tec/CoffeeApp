//
//  RatingView+ViewModel.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 07/06/2024.
//

import Foundation

class RatingViewModel: ObservableObject {

    enum UIState {
        case loading
        case success
        case error
    }

    enum Input {
        case submit
    }

    var date = Date()
    var name = ""
    var reviewDetails = ""
    var sliderValue: Double = 5.0

    @Published var state: UIState = .success

    func send(input: Input) {
        switch input {
        case .submit: submit()
        }
    }

    func submit() {
        let network = CoffeeAPIClient()
        do {
            try network.submitReview()
        } catch {
            state = .error
        }
    }
}
