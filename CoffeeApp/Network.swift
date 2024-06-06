import Foundation

class CoffeeAPIClient {
    private let baseURL = "https://api.sampleapis.com"

    func fetchHotCoffee(completion: @escaping (Result<[Coffee], Error>) -> Void) {
        let endpoint = "/coffee/hot"
        guard let url = URL(string: baseURL + endpoint) else {
            return completion(.failure(NSError(domain: "Invalid URL", code: 1, userInfo: nil)))
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }

            guard let data = data else {
                return completion(.failure(NSError(domain: "No data", code: 2, userInfo: nil)))
            }

            do {
                let decoder = JSONDecoder()
                let coffeeList = try decoder.decode([Coffee].self, from: data)
                completion(.success(coffeeList))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
