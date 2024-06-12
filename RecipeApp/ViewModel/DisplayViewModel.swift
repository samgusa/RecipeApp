//
//  DisplayViewModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import Foundation

struct DisplayViewModel: Hashable {
    var idMeal: String = ""
    var strMeal: String = ""
    var strCategory: String = ""
    var strArea: String = ""
    var strInstructions: [String.SubSequence] = []
    var strMealThumb: String = ""
    var strIngredients: [String] = []
    var strMeasure: [String] = []
    var strTotalIngredients: [TotalIngredients] = []
    var strSource: String = ""
}

struct TotalIngredients: Hashable {
    var ingredient: String = ""
    var measure: String = ""
}
