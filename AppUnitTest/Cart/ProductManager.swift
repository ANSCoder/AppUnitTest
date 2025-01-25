//
//  ProductManager.swift
//  AppUnitTest
//
//  Created by Anand Nimje on 25/01/25.
//

import Foundation

class ProductManager {
    private let networkEngine: NetworkRequestable

    init(networkEngine: NetworkRequestable) {
        self.networkEngine = networkEngine
    }

    func fetchProducts() async throws -> [String] {
        let request = APIRequest(
            url: URL(string: "https://api.example.com/products")!,
            method: "GET",
            headers: nil,
            body: nil
        )
        return try await networkEngine.fetch(request, responseType: [String].self)
    }
}
