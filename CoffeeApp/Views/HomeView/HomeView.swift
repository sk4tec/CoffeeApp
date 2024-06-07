import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success(let coffeeList):
                List(coffeeList) { coffee in
                    NavigationLink {
                        DetailView(id: coffee.id, description: coffee.title, title: coffee.description, image: coffee.image, ingredients: coffee.ingredients)
                    } label: {
                        Text("\(coffee.title) \(coffee.like ? "👍🏽" : "")")
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
