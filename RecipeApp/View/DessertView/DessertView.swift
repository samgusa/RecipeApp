//
//  DessertView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import SwiftUI

struct DessertView: View {

    @StateObject var dessertViewModel = DessertViewModel()

    @State var mealId: String = "53049"

    var body: some View {
        ZStack {
            Color.brown.opacity(0.4).ignoresSafeArea()

            ScrollView {
                Text(dessertViewModel.displayViewModel.strMeal)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                AsyncImage(
                    url:
                        URL(string: dessertViewModel.displayViewModel.strMealThumb)) { image in
                                image
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 300)

                DessertInstructionView(instructions: dessertViewModel.displayViewModel.strInstructions)

                DessertIngredientsView(ingredientsArr: dessertViewModel.displayViewModel.strTotalIngredients)
            }
            .task {
                await dessertViewModel.getDessertsDetails(mealId: mealId)
            }
        }
    }
}

#Preview {
    DessertView()
}
