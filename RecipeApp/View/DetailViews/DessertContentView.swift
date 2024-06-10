//
//  DessertContentView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import SwiftUI

struct DessertContentView: View {

    let dessertModel: DessertModel

    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: dessertModel.mealImage)) { phase in
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
            Text(dessertModel.mealName)
                .font(.caption)
                .padding([.top, .bottom], 10)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    DessertContentView(dessertModel: DessertModel(mealName: "Chocolate Cake",
                                                 mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                                                 mealId: "1"))
}
