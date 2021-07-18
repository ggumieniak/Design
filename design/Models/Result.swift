//
//  Result.swift
//  design
//
//  Created by Grzegorz Gumieniak on 16/07/2021.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String : [String]]?
}
