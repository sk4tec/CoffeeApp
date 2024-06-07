//
//  RatingView+ViewModel.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 07/06/2024.
//

import Foundation

class RatingViewModel: ObservableObject {
    enum Input {
    case submit
    }

    var date = Date()
    var name = ""
    var reviewDetails = ""
    var sliderValue: Double = 5.0

}
