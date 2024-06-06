import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CoffeeViewModel()

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success(let coffeeList):
                List(coffeeList) { coffee in
                    NavigationLink(coffee.title, destination: DetailView(text: coffee.title, title: coffee.description, image: coffee.image))
                }
            case .error(let error):
                ErrorView(errorMessage: error)
            }
        }
        .onAppear {
            viewModel.fetchCoffee()
        }
    }
}

#Preview {
    ContentView()
}
