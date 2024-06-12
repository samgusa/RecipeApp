//
//  DessertIngredientsView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import SwiftUI

struct DessertIngredientsView: View {

    var ingredientsArr: [IngredientsModel] = []

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            HStack {
                VStack(alignment: .leading) {
                    ForEach(ingredientsArr, id: \.self) { total in
                        Text("• " + total.measure + " " + total.ingredient)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 5)
                    }
                }
                Spacer()
            }
        }
        .padding(.leading, 8)
    }
}

#Preview {
    DessertView()
}
