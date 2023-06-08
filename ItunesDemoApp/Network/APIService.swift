//
//  APIService.swift
//  ItunesDemoApp
//
//  Created by talate on 7.06.2023.
//

import Foundation

protocol API {
    func searchMusic(with term: String, offset: Int) async throws -> [Song]
}

class APIService {
    private func request<T>(for endpoint: Endpoint) async throws -> T where T: Decodable {
        do {
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: endpoint.url))
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            guard !data.isEmpty else {
                throw NetworkError.emptyData
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError(error)
            }
        }catch {
            throw NetworkError.networkError(error)
        }
    }
}

extension APIService: API {
    func searchMusic(with term: String, offset: Int = 0) async throws -> [Song] {
        let endpoint = APIEndpoint.search(term: term, media: "music", country: "de", limit: 25, offset: offset, sort: "recent").endpoint
        let response: SearchResponse = try await request(for: endpoint)
        let results = response.results
        let sortedResults = results.sorted(by: { $0.artistName.lowercased() < $1.artistName.lowercased()})
        return sortedResults
    }
}
