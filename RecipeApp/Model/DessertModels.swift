//
//  DessertModels.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import Foundation

struct DessertIngredientsModel: Hashable {
    var ingredient: String = ""
    var measure: String = ""
}

struct DetailedMeal: Codable, Hashable {
    let mealId: String?
    let mealName: String?
    let mealInstructions: String?
    let mealImage: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?

    init() {
        self.mealId = nil
        self.mealName = nil
        self.mealInstructions = nil
        self.mealImage = nil
        self.strIngredient1 = nil
        self.strIngredient2 = nil
        self.strIngredient3 = nil
        self.strIngredient4 = nil
        self.strIngredient5 = nil
        self.strIngredient6 = nil
        self.strIngredient7 = nil
        self.strIngredient8 = nil
        self.strIngredient9 = nil
        self.strIngredient10 = nil
        self.strIngredient11 = nil
        self.strIngredient12 = nil
        self.strIngredient13 = nil
        self.strIngredient14 = nil
        self.strIngredient15 = nil
        self.strIngredient16 = nil
        self.strIngredient17 = nil
        self.strIngredient18 = nil
        self.strIngredient19 = nil
        self.strIngredient20 = nil
        self.strMeasure1 = nil
        self.strMeasure2 = nil
        self.strMeasure3 = nil
        self.strMeasure4 = nil
        self.strMeasure5 = nil
        self.strMeasure6 = nil
        self.strMeasure7 = nil
        self.strMeasure8 = nil
        self.strMeasure9 = nil
        self.strMeasure10 = nil
        self.strMeasure11 = nil
        self.strMeasure12 = nil
        self.strMeasure13 = nil
        self.strMeasure14 = nil
        self.strMeasure15 = nil
        self.strMeasure16 = nil
        self.strMeasure17 = nil
        self.strMeasure18 = nil
        self.strMeasure19 = nil
        self.strMeasure20 = nil
    }

    enum CodingKeys: String, CodingKey {
        case mealId = "idMeal"
        case mealName = "strMeal"
        case mealInstructions = "strInstructions"
        case mealImage = "strMealThumb"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    func getFormattedInstructions() -> [String] {
        guard let instructions = mealInstructions else { return [] }
        let steps = instructions.split(separator: "\n").map { String($0) }
        var formattedSteps: [String] = []

        for (index, step) in steps.enumerated() {
            if step.trimmingCharacters(in: .whitespaces).prefix(1).rangeOfCharacter(from: .decimalDigits) == nil {
                formattedSteps.append("\(index + 1). \(step)")
            } else {
                formattedSteps.append(step)
            }
        }
        return formattedSteps
    }
}


struct DetailedMeals: Codable {
    let meals: [DetailedMeal]
}
