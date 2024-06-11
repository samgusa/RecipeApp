//
//  MealModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation

struct Meal: Codable, Identifiable {
    let id: String
    let name: String
    let imageUrlString: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrlString = "strMealThumb"
    }
}

struct Meals: Codable {
    let meals: [Meal]
}
