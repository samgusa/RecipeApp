//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by Sam Greenhill on 6/10/24.
//

import XCTest
@testable import RecipeApp

final class RecipeAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test fetching meal data
//    func testFetchMealData() async throws {
//        // Arrange
//        let expectation = expectation(description: "Fetch meal data")
//
//        // Act
//        do {
//            let meals = try await WebService.fetchMealData()
//
//            // Assert
//            XCTAssertFalse(meals.isEmpty, "No meals fetched")
//
//            // Validate properties of fetched meals
//            for meal in meals {
//                XCTAssertFalse(meal.strMeal.isEmpty, "Empty meal name")
//                XCTAssertFalse(meal.strMealThumb.isEmpty, "Empty meal image URL")
//                XCTAssertFalse(meal.idMeal.isEmpty, "Empty meal ID")
//            }
//        } catch {
//            XCTFail("Failed to fetch meal data: \(error.localizedDescription)")
//        }
//
//        // Fulfill expectation
//        expectation.fulfill()
//
//        // Wait for the expectation to be fulfilled
//        await fulfillment(of: [expectation], timeout: 5) // Adjust timeout as needed
//    }


}
