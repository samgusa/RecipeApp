//
//  Array+Extensions.swift
//  RecipeApp
//
//  Created by Sam Greenhill on 6/12/24.
//

import Foundation

extension Array where Element == String.SubSequence {
    // Function to add numbers to instructions if not already present
    func addNumbersToInstructions() -> [String] {
        var instructionsArray: [String] = self.map(String.init)
        for (index, instruction) in instructionsArray.enumerated() {
            if !instruction.starts(with: "\(index + 1).") {
                instructionsArray[index] = "\(index + 1). \(instruction)"
            }
        }
        return instructionsArray
    }
}
