import Foundation

class CoffeeViewModel: ObservableObject {
    @Published var coffeeList: [Coffee] = []
    
    func fetchHotCoffee() {
        let network = CoffeeAPIClient()
        
        network.fetchHotCoffee { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coffeeList):
                    self.coffeeList = coffeeList
                case .failure(let error):
                    print("Error fetching coffee data: \(error)")
                }
            }
        }
    }
}
