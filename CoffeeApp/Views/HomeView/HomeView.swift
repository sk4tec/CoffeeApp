import SwiftUI
// Notes on this take home project. I wanted to be careful not to exceed the 8 hours recommended time limit. These are outstanding tasks:
// 1 - I didn't get to persist the data - I saved this till last and I ran out of time. I would imagine
//     that SwiftData would be the way to go, I would decorate my CoffeeModel and I would try and load that if I didn't have network Access
// 2 - I couldn't get the "like" to work at the master level, NavigationView shares it's data as an Environment Object and I should be able to access that in the Detail View.
//     But, this didn't work and crashed - I commented it out and moved on.
// 3 - I didn't include any Combine because there really wasn't a need to overcomplicate the code. But send(input: Input) funcs could send to PassThroughSubjects.
// 4 - Strings should be localised

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
