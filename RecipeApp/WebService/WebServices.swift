//
//  WebServices.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation

final class WebService {

    private static let baseURL = "https://themealdb.com/api/json/v1/1/"

    static func fetchMealData() async throws -> Meals {
        let urlString = baseURL + "filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Meals.self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }

    static func fetchDessertData(idMeal: String) async throws -> DetailedMeal {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            throw ErrorCases.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            let detailedMeals = try decoder.decode(DetailedMeals.self, from: data)
            guard let detailedMeal = detailedMeals.meals.first else {
                throw ErrorCases.invalidData
            }

            return detailedMeal
        } catch {
            throw ErrorCases.invalidData
        }
    }

    static func filterDesserts(detailedMeal: DetailedMeal) -> DisplayViewModel {
        var dessertDisplayModel: DisplayViewModel = DisplayViewModel()

        let mirror = Mirror(reflecting: detailedMeal)

        // Filter out null and empty values
        for child in mirror.children {
            if let value = child.value as? String,
               let label = child.label {
                if value != "" && value != " "
                {
                    switch label {
                    case "idMeal":
                        dessertDisplayModel.idMeal = value
                    case "strMeal":
                        dessertDisplayModel.strMeal = value
                    case "strInstructions":
                        dessertDisplayModel.strInstructions = value.split(whereSeparator: \.isNewline)
                    case "strMealThumb":
                        dessertDisplayModel.strMealThumb = value
                    case _ where label.contains("strIngredient"):
                        dessertDisplayModel.strIngredients.append(value)
                    case _ where label.contains("strMeasure"):
                        dessertDisplayModel.strMeasure.append(value)
                    default:
                        break
                    }
                }
            }
        }

        if dessertDisplayModel.strIngredients.count == dessertDisplayModel.strMeasure.count {
            for index in dessertDisplayModel.strIngredients.indices {
                if let firstCharMeasure = dessertDisplayModel.strMeasure[index].first {
                    if firstCharMeasure.isUppercase || firstCharMeasure.isNumber {
                        dessertDisplayModel
                            .strTotalIngredients
                            .append(
                                TotalIngredients(
                                    ingredient: dessertDisplayModel.strIngredients[index],
                                    measure: dessertDisplayModel.strMeasure[index])
                            )
                    }
                    else {
                        // For measurements that don't have numbers, swap ingredients and measurements
                        dessertDisplayModel
                            .strTotalIngredients
                            .append(
                                TotalIngredients(
                                    ingredient: dessertDisplayModel.strMeasure[index],
                                    measure: dessertDisplayModel.strIngredients[index])
                            )
                    }
                }
            }
        }
        return dessertDisplayModel
    }
}
