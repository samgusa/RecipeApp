//
//  WebServices.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation

final class WebService {

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    private static let baseURL = "https://themealdb.com/api/json/v1/1/"
    
    func fetchMealData() async throws -> Meals {
            let urlString = WebService.baseURL + "filter.php?c=Dessert"
            guard let url = URL(string: urlString) else {
                throw ErrorCases.invalidURL
            }

            let (data, response) = try await session.data(from: url)
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

     func fetchDessertData(idMeal: String) async throws -> DetailedMeal {
        guard let url = URL(string: WebService.baseURL + "lookup.php?i=\(idMeal)") else {
            throw ErrorCases.invalidURL
        }

        let (data, response) = try await session.data(from: url)
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

    static func filterDesserts(detailedMeal: DetailedMeal) -> DisplayModel {
        var dessertDisplayModel: DisplayModel = DisplayModel()

        let mirror = Mirror(reflecting: detailedMeal)

        // Filter out null and empty values
        for child in mirror.children {
            if let value = child.value as? String,
               let label = child.label {
                if value != "" && value != " "
                {
                    switch label {
                    case "mealId":
                        dessertDisplayModel.idMeal = value
                    case "mealName":
                        dessertDisplayModel.mealName = value
                    case "mealInstructions":
                        dessertDisplayModel.mealInstructions = value.split(whereSeparator: \.isNewline)
                    case "mealImage":
                        dessertDisplayModel.mealImage = value
                    case _ where label.contains("strIngredient"):
                        dessertDisplayModel.mealIngredients.append(value)
                    case _ where label.contains("strMeasure"):
                        dessertDisplayModel.mealMeasures.append(value)
                    default:
                        break
                    }
                }
            }
        }

        if dessertDisplayModel.mealIngredients.count == dessertDisplayModel.mealMeasures.count {
            for index in dessertDisplayModel.mealIngredients.indices {

                if let firstCharMeasure = dessertDisplayModel.mealMeasures[index].first {
                    
                    if firstCharMeasure.isUppercase || firstCharMeasure.isNumber {
                        dessertDisplayModel
                            .mealTotalIngredients
                            .append(
                                IngredientsModel(
                                    ingredient: dessertDisplayModel.mealIngredients[index],
                                    measure: dessertDisplayModel.mealMeasures[index])
                            )
                    }
                    else {
                        // For measurements that don't have numbers, swap ingredients and measurements
                        dessertDisplayModel
                            .mealTotalIngredients
                            .append(
                                IngredientsModel(
                                    ingredient: dessertDisplayModel.mealMeasures[index],
                                    measure: dessertDisplayModel.mealIngredients[index])
                            )
                    }
                }
            }
        }
        return dessertDisplayModel
    }
}
