import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoffeeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.coffeeList) { coffee in
                NavigationLink(coffee.title, destination: DetailView(text: coffee.title, title: coffee.description, image: coffee.image))
            }
        }
        .onAppear {
            viewModel.fetchHotCoffee()
        }
    }
}

#Preview {
    ContentView()
}
