//
//  MockCartManagerDelegate.swift
//  AppUnitTestTests
//
//  Created by Anand Nimje on 25/01/25.
//

@testable import AppUnitTest
import Foundation
import XCTest

class MockCartManagerDelegate: CartManagerDelegate {
    var updatedItems: [String] = []
    var expectation: XCTestExpectation?
    
    func didUpdateCart(with items: [String]) {
        updatedItems = items
        expectation?.fulfill()
    }
}
