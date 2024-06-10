//
//  ContentView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/10/24.
//

import SwiftUI

struct ContentView: View {

    //Dummy Data
    let desserts: [DessertModel] = [
        DessertModel(mealName: "Chocolate Cake",
                     mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                     mealId: "1"),
        DessertModel(mealName: "Apple Pie", mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", mealId: "2"),
        DessertModel(mealName: "Cheesecake", mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", mealId: "3"),
        DessertModel(mealName: "Ice Cream", mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", mealId: "4"),
        DessertModel(mealName: "Brownies", mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", mealId: "5"),
        DessertModel(mealName: "Donuts", mealImage: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", mealId: "6")
    ]

    // Columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(desserts) { dessert in
                        DessertContentView(dessertModel: dessert)
                    }
                }
                .padding()
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
}
