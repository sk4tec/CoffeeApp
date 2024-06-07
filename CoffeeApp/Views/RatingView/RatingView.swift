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
        switch viewModel.state {
        case .error: ErrorView(errorMessage: "Oh no!")
        case .loading: LoadingView()
        case .success: content
        }
    }

    var content: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Name")
                TextField("Enter Name", text: $viewModel.name)
            }
            DatePicker("Date", selection: $viewModel.date)
            TextField("Enter Review", text: $viewModel.reviewDetails)
            Text("How much did you like the drink?")
            Slider(value: $viewModel.sliderValue, in: 0...4, step: 1)

            Button("Submit your review") {
                viewModel.send(input: .submit)
            }
        }
        .padding(.horizontal, 12.0)
        .padding()
    }
}

#Preview {
    RatingView()
}
