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
        VStack(spacing: 0) {
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
            Text(mealModel.name)
                .font(.caption)
                .padding([.top, .bottom], 10)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    MealCellView(mealModel: Meal(id: "1", name: "1", imageUrlString: "1"))
}
