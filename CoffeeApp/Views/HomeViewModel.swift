import Foundation

class HomeViewModel: ObservableObject {
    @Published var state: UIState = .loading
    
    enum UIState {
        case loading
        case success([Coffee])
        case error(String)
    }
    
    func fetchCoffee() {
        let network = CoffeeAPIClient()
        
        network.fetchCoffee { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coffeeList):
                    self.state = .success(coffeeList)
                case .failure(let error):
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
