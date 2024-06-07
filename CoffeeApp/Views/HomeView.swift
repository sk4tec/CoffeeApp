import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success(let coffeeList):
                List(coffeeList) { coffee in
                    NavigationLink {
                        DetailView(description: coffee.title, title: coffee.description, image: coffee.image, ingredients: coffee.ingredients)
                    } label: {
                        Text("\(coffee.title)")
                    }

                }
                .navigationTitle("Coffee for Coders")
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
    HomeView()
}
