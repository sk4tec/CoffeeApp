//
//  DetailView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import SwiftUI

struct DetailView: View {
    let description: String
    let title: String
    let image: String
    let ingredients: [String]
    @State private var like = false
    
    var body: some View {
        VStack(spacing: 12) {
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
            Text(description)
            List {
                ForEach (ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            Spacer()
            NavigationLink(destination: RatingView()) {
                Text("Rating")
            }
            
            Button("Like") {
                like = true
            }
        }
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    DetailView(description: "This is some lovely super hot coffee, straight from the suppliers of Volcanic coffee. It comes deep from the ground and is super lovely", title: "Super Lava Coffee", image: "image", ingredients: ["Coffee", "Soil", "Beans", "lava"])
}
