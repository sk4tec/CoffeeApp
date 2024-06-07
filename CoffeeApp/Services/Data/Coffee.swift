import Foundation

struct CoffeeModel: Codable, Identifiable {
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

struct Coffee: Identifiable {
    var id =  UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
    var like = false    
}
