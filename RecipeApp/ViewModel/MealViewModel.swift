//
//  MealViewModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation


@MainActor
final class MealViewModel: ObservableObject {

    @Published var meals: Meals = Meals(meals: [])
    @Published var isLoading = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?

    private let webService: WebService

    init(webService: WebService = WebService()) {
        self.webService = webService
    }

    func getMeals() async {
        isLoading = true
        do {
            let meals = try await webService.fetchMealData()
            self.meals = meals
            self.isLoading = false
        } catch (let error) {
            print(error.localizedDescription)
            self.isLoading = false
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
