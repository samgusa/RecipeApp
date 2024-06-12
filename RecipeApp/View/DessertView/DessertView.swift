//
//  DessertView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import SwiftUI

struct DessertView: View {

    @StateObject var dessertViewModel = DessertViewModel()

    @State var mealId: String = "52853"

    var body: some View {
        ZStack {
            Color.brown.opacity(0.4).ignoresSafeArea()

            ScrollView {
                Text(dessertViewModel.displayViewModel.mealName)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                AsyncImage(
                    url:
                        URL(string: dessertViewModel.displayViewModel.mealImage)) { image in
                                image
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 300)

                DessertInstructionView(instructions: dessertViewModel.displayViewModel.mealInstructions)

                DessertIngredientsView(ingredientsArr: dessertViewModel.displayViewModel.mealTotalIngredients)
            }

            if dessertViewModel.isLoading {
                ProgressView()
                    .scaleEffect(2.0, anchor: .center)
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.primary)
            }
        }
        .task {
            await dessertViewModel.getDessertsDetails(mealId: mealId)
        }
        .alert(isPresented: $dessertViewModel.shouldShowError) {
            return Alert(title: Text("Error!"),
                         message: Text(dessertViewModel.errorMessage ?? ""))
        }
    }
}

#Preview {
    DessertView()
}
