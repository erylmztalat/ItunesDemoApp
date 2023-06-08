//
//  ApiEndpoint.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import Foundation

enum APIEndpoint {
    case search(term: String, media: String, country: String, limit: Int, offset: Int, sort: String)
    
    var endpoint: Endpoint {
        switch self {
        case .search(let term, let media, let country, let limit, let offset, let sort):
            return Endpoint(path: "/search", queryItems: [
                URLQueryItem(name: "term", value: term),
                URLQueryItem(name: "media", value: media),
                URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "sort", value: sort)
            ])
        }
    }
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url!
    }
}
