//
//  NetworkEngine.swift
//  AppUnitTest
//
//  Created by Anand Nimje on 25/01/25.
//

import Combine
import Foundation

protocol NetworkRequestable {
    func fetch<T: Decodable>(_ request: APIRequest, responseType: T.Type) async throws -> T
}

class NetworkEngine: NetworkRequestable {
    func fetch<T: Decodable>(_ request: APIRequest, responseType: T.Type) async throws -> T {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
