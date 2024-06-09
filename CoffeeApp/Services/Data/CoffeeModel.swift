//
//  CoffeeModel.swift
//  CoffeeApp
//
//  Created by Sunjay Kalsi on 09/06/2024.
//

import Foundation

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
