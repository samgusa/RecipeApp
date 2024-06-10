//
//  DessertViewModel.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import Foundation


@MainActor
final class DessertViewModel: ObservableObject {

    @Published var users: [DessertModel]?
    @Published var isLoading = false
    @Published var shouldShowError = false
    @Published var errorMessage: String?


    func getUser() async {
        isLoading = true
    }

}
