//
//  DetailView.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 06/06/2024.
//

import SwiftUI

struct DetailView: View {
    let id: UUID
    let description: String
    let title: String
    let image: String
    let ingredients: [String]
    @State private var like = false
    @EnvironmentObject var viewModel: HomeViewModel

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
                Text("Review this Coffee")
            }
            
            Button("Like") {
// I don't know why this environment isn't found it should be available as this is a child View of it's parent NavigationView

//                switch self.viewModel.state {
//                case var .success(coffee):
//                    var coffeeIndex = coffee.firstIndex { coffee in coffee.id == self.id }
//                    if let coffeeIndex {
//                        coffee[coffeeIndex].like.toggle()
//                    }
//                default: break
//                }
//                like = true
            }
        }
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    DetailView(id: UUID(), description: "This is some lovely super hot coffee, straight from the suppliers of Volcanic coffee. It comes deep from the ground and is super lovely", title: "Super Lava Coffee", image: "https://images.unsplash.com/photo-1599398054066-846f28917f38?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", ingredients: ["Coffee", "Soil", "Beans", "lava"])
}
