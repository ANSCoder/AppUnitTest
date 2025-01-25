//
//  APIRequest.swift
//  AppUnitTest
//
//  Created by Anand Nimje on 25/01/25.
//

import Foundation

struct APIRequest {
    let url: URL
    let method: String
    let headers: [String: String]?
    let body: Data?
}
