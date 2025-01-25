//
//  CartManagerTests.swift
//  AppUnitTestTests
//
//  Created by Anand Nimje on 25/01/25.
//

import XCTest
@testable import AppUnitTest

final class CartManagerTests: XCTestCase {
    func testDelegateCalledOnAddItem() {
        let cartManager = CartManager()
        let mockDelegate = MockCartManagerDelegate()
        mockDelegate.expectation = expectation(description: "Delegate method called")
        cartManager.delegate = mockDelegate
        
        // Adding test value here
        cartManager.addItem("TShirt XL Size")
        waitForExpectations(timeout: 1, handler: nil)

        XCTAssertEqual(mockDelegate.updatedItems, ["TShirt XL Size"], "Value should be Equal.")
    }
}
