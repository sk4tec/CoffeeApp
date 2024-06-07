//
//  RatingView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 07/06/2024.
//

import SwiftUI

struct RatingView: View {
    @StateObject var viewModel = RatingViewModel()

    var body: some View {
        VStackLayout(alignment: .leading, spacing: 12.0) {
            HStack {
                Text("Name")
                TextField("Enter Name", text: $viewModel.name)
            }
            DatePicker("Date", selection: $viewModel.date)
            TextField("Enter Review", text: $viewModel.reviewDetails)
            Text("How much did you like the drink?")
            Slider(value: $viewModel.sliderValue, in: 0...4, step: 1)

            Button("Submit your review") {
                
            }
        }
        .padding()
    }
}

#Preview {
    RatingView()
}
