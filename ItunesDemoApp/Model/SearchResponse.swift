//
//  SearchResponse.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import Foundation

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Song]
}
