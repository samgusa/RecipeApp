//
//  DessertViewModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import Foundation

@MainActor
class DessertViewModel: ObservableObject {

    @Published var detailedMeals: DetailedMeals = DetailedMeals(meals: [])
    @Published var displayViewModel: DisplayModel = DisplayModel()
    @Published var isLoading = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?


    func getDessertsDetails(mealId: String) async {
        isLoading = true
        do {
            let detailedMeal = try await WebService.fetchDessertData(idMeal: mealId)
            let filteredDessert = WebService.filterDesserts(detailedMeal: detailedMeal)
            self.displayViewModel = filteredDessert
            self.isLoading = false
        } catch {
            self.isLoading = false
            self.shouldShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
