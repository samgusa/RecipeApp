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

    static func getUserData() async throws -> [Meal] {
        let urlString = baseURL + "filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Meal].self, from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
