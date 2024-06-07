import Foundation

protocol CoffeeAPIClientProtocol {
    func fetchCoffee(completion: @escaping (Result<[CoffeeModel], Error>) -> Void)
    func submitReview() async throws
}

class CoffeeAPIClient: CoffeeAPIClientProtocol {
    func submitReview() throws {
        throw Error.unknown
    }

    private let baseURL = "https://api.sampleapis.com"

    func fetchCoffee(completion: @escaping (Result<[CoffeeModel], Error>) -> Void) {
        let endpoint = "/coffee/hot"
        guard let url = URL(string: baseURL + endpoint) else {
            return completion(.failure(Error.networkError))
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return completion(.failure(Error.networkError))
            }

            guard let data = data else {
                return completion(.failure(Error.networkError))
            }

            do {
                let decoder = JSONDecoder()
                let coffeeList = try decoder.decode([CoffeeData].self, from: data)
                
                let coffeeRet = coffeeList.map { CoffeeModel(title: $0.title, description: $0.description, ingredients: $0.ingredients, image: $0.image)
                }
                
                completion(.success(coffeeRet))
            } catch {
                completion(.failure(Error.networkError))
            }
        }
        task.resume()
    }
}
