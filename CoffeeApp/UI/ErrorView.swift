//
//  ErrorView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Text("Error 🥺")
                .font(.headline)
            Text(errorMessage)
                .font(.subheadline)
        }
    }
}

#Preview {
    ErrorView(errorMessage: "Out of Coffee 🥺")
}
