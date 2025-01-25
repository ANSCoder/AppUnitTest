//
//  MockNetworkEngine.swift
//  AppUnitTestTests
//
//  Created by Anand Nimje on 25/01/25.
//

@testable import AppUnitTest
import Foundation

class MockNetworkEngine: NetworkRequestable {
    var mockResponse: Any?
    var mockError: Error?
    
    func fetch<T>(_ request: APIRequest, responseType: T.Type) async throws -> T where T : Decodable {
        if let error = mockError {
            throw error
        }
        guard let response = mockResponse as? T else {
            throw URLError(.cannotDecodeContentData)
        }
        return response
    }
}
