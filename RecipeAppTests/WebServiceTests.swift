//
//  WebServiceTests.swift
//  RecipeAppTests
//
//  Created by Sam Greenhill on 6/13/24.
//

import XCTest
@testable import RecipeApp

final class WebServiceTests: XCTestCase {

    var mockURLSession: MockURLSession!
    var webService: WebService!

    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        webService = WebService(session: mockURLSession)

    }

    override func tearDown() {
        mockURLSession = nil
        webService = nil
        super.tearDown()
    }

    func testFetchMealDataSuccess() async throws {
        let jsonData = """
                {
                    "meals": [
                        {
                            "idMeal": "12345",
                            "strMeal": "Test Meal",
                            "strMealThumb": "test_thumb.jpg"
                        }
                    ]
                }
                """.data(using: .utf8)!

        mockURLSession.data = jsonData
        mockURLSession.response = HTTPURLResponse(url: URL(string: "https://themealdb.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)

        let meals = try await webService.fetchMealData()
        XCTAssertEqual(meals.meals.first?.id, "12345")
        XCTAssertEqual(meals.meals.first?.mealName, "Test Meal")
        XCTAssertEqual(meals.meals.first?.imageUrlString, "test_thumb.jpg")
    }

    func testFetchMealDataFailure() async {
        mockURLSession.error = NSError(domain: "Test", code: 1, userInfo: nil)

        do {
            _ = try await webService.fetchMealData()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as NSError).domain, "Test")
        }

    }


}
