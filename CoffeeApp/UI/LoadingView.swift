//
//  LoadingView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            Text("Brewing Coffee ☕️")
        }
    }
}

#Preview {
    LoadingView()
}
