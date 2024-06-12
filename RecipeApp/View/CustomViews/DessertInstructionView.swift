//
//  DessertInstructionView.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/11/24.
//

import SwiftUI

struct DessertInstructionView: View {
    var instructions: [String.SubSequence] = []

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Instructions: ")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.bottom, 10)

            ForEach(Array(instructions.addNumbersToInstructions()), id: \.self) { instruction in
                Text(instruction)
                    .font(.headline)
                    .padding(.bottom)
            }
        }
        .padding(.leading, 8)
    }
}

#Preview {
    DessertView()
}
