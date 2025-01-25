//
//  ProductManagerTests.swift
//  AppUnitTestTests
//
//  Created by Anand Nimje on 25/01/25.
//

import XCTest
@testable import AppUnitTest

final class ProductManagerTests: XCTestCase {
    func testFetchProductsSuccess() async throws {
        let mockEngine = MockNetworkEngine()
        mockEngine.mockResponse = ["Product1", "Product2", "Product3"]

        let productManager = ProductManager(networkEngine: mockEngine)
        let products = try await productManager.fetchProducts()
        XCTAssertEqual(products, ["Product1", "Product2", "Product3"], "Values Should be Equal.")
    }
   
    func testFetchProductsFailure() async throws {
        let mockEngine = MockNetworkEngine()
        mockEngine.mockError = URLError(.badServerResponse)
        let productManager = ProductManager(networkEngine: mockEngine)
        do {
            _ = try await productManager.fetchProducts()
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertTrue(error is URLError, "Expected error thrown")
        }
    }
}
