//
//  DisplayViewModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import Foundation

struct DisplayModel: Hashable {
    var idMeal: String = ""
    var mealName: String = ""
    var strCategory: String = ""
    var mealInstructions: [String.SubSequence] = []
    var mealImage: String = ""
    var mealIngredients: [String] = []
    var mealMeasures: [String] = []
    var mealTotalIngredients: [IngredientsModel] = []
}

struct IngredientsModel: Hashable {
    var ingredient: String = ""
    var measure: String = ""
}
