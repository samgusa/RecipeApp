//
//  ContentView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import SwiftUI

struct ContentView: View {

    // ViewModel
    @ObservedObject var viewModel = MealViewModel()

    // Columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.brown.opacity(0.4).ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.meals.meals) { meal in
                            MealCellView(mealModel: meal)
                        }

                    }
                    .padding()
                }
                .listRowBackground(Color.black)
                .navigationTitle("Desserts")

                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.primary)
                }
            }
        }
        .task {
            await viewModel.getMeals()
        }
        .alert(isPresented: $viewModel.shouldShowError) {
            return Alert(title: Text("Error!"),
                         message: Text(viewModel.errorMessage ?? ""))
        }
    }
}

#Preview {
    ContentView()
}
