//
//  DessertModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation

struct DessertModel: Codable, Identifiable {
    let id = UUID()
    let mealName: String
    let mealImage: String
    let mealId: String

    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case mealImage = "strMealThumb"
        case mealId = "idMeal"
    }
}
