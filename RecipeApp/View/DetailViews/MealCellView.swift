//
//  DessertCellView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import SwiftUI

struct MealCellView: View {

    let mealModel: Meal

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: mealModel.imageUrlString)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                } else if phase.error != nil {
                    Color.red // Indicates an error
                        .frame(width: 100, height: 100)
                } else {
                    Color.gray // Acts as a placeholder
                        .frame(width: 100, height: 100)
                }
            }
            ZStack {
                Text(mealModel.mealName)
                    .foregroundStyle(.white)
                    .font(.callout)
                    .bold()
                    .minimumScaleFactor(0.6)
                    .padding([.top, .bottom], 10)
                    .padding(.horizontal, 5)
                    .frame(width: 100, height: 30)
                    .background(Color.black.opacity(0.2))
            }
        }

        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
