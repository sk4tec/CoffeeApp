//
//  DetailView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import SwiftUI

struct DetailView: View {
    let text: String
    let title: String
    let image: String
    
    var body: some View {
        VStack {
            Text(text)
            if let imageUrl = URL(string: image) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                .clipped()
            }

        }
        .navigationTitle(title)
    }
}

#Preview {
    DetailView(text: "text", title: "title", image: "image")
}
