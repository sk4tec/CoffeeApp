import Foundation

struct CoffeeData: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String

    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case ingredients
        case image
    }
}

struct CoffeeModel: Identifiable {
    var id =  UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
    var like = false    
}

enum Error: Swift.Error {
    case unknown
    case networkError
}
